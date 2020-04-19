# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::Rendering do
  describe '.render_with_stdin_stdout' do
    it 'call render_with_command' do
      allow(described_class).to receive(:render_with_command)

      described_class.render_with_stdin_stdout('command', 'content')

      expect(described_class).to have_received(:render_with_command).with(
        'command', :stdout, stdin_data: 'content'
      )
    end
  end

  describe '.render_with_tempfile' do
    before do
      allow(described_class).to receive(:render_with_command)

      allow(Dir).to receive(:mktmpdir).and_yield('/tmp')
      allow(File).to receive(:write)
      allow(Tempfile).to receive_message_chain(:new, :close!)
      allow(Tempfile).to receive_message_chain(:new, :path)
    end

    it 'call Dir.mktmpdir to create a direcory' do
      allow(Dir).to receive(:mktmpdir)

      described_class.render_with_tempfile('command', 'content')

      expect(Dir).to have_received(:mktmpdir)
    end

    it 'call Tempfile.new twice to create temp file' do
      described_class.render_with_tempfile('command', 'content') {}

      expect(Tempfile).to have_received(:new).twice
    end

    it 'call render_with_command' do
      described_class.render_with_tempfile('command', 'content') {}

      expect(described_class).to have_received(:render_with_command)
    end
  end

  describe '.render_with_command' do
    it 'call Open3.capture3 to render' do
      status = Object.new
      allow(status).to receive(:success?).and_return(true)
      allow(Open3).to receive(:capture3).and_return(['o', 'e', status])

      described_class.render_with_command('command')

      expect(Open3).to have_received(:capture3)
    end

    context 'when command not found' do
      it 'raise a command not found error' do
        allow(Open3).to receive(:capture3).and_raise(Errno::ENOENT)

        expect do
          described_class.render_with_command('command_that_is_not_exist')
        end.to raise_error Jekyll::Diagrams::Errors::CommandNotFoundError
      end
    end

    context 'when rendering failed' do
      before do
        status = Object.new
        allow(status).to receive(:success?).and_return(false)
        allow(Open3).to receive(:capture3).and_return(['o', 'e', status])
      end

      it 'raise a rendering failed error' do
        expect do
          described_class.render_with_command('command_that_will_failed')
        end.to raise_error Jekyll::Diagrams::Errors::RenderingFailedError
      end
    end

    context 'when output is stdout' do
      before do
        status = Object.new
        allow(status).to receive(:success?).and_return(true)
        allow(Open3).to receive(:capture3).and_return(['o', 'e', status])
      end

      it 'read output from stdout' do
        expect(described_class.render_with_command('cmd', :stdout)).to eq 'o'
      end
    end

    context 'when output is a file' do
      before do
        status = Object.new
        allow(status).to receive(:success?).and_return(true)
        allow(Open3).to receive(:capture3).and_return(['o', 'e', status])
        allow(File).to receive(:read)
      end

      it 'read output from the file' do
        described_class.render_with_command('cmd', 'a_file')

        expect(File).to have_received(:read).with('a_file')
      end
    end
  end
end
