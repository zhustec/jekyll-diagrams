# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::MermaidRenderer do
  subject(:renderer) do
    described_class.new(Liquid::ParseContext.new, '')
  end

  describe '#render_svg' do
    it 'call build_command' do
      allow(renderer).to receive(:build_command)
      allow(renderer).to receive(:render_with_tempfile).and_yield('in', 'out')

      renderer.render_svg('', {})

      expect(renderer).to have_received(:render_with_tempfile)
    end
  end

  describe '#build_command' do
    context 'when config is empty' do
      subject { renderer.build_command(config) }

      let(:config) { {} }

      it { is_expected.to match 'mmdc --puppeteerConfigFile' }
    end

    context 'when command_path is set' do
      subject { renderer.build_command(config) }

      let(:config) { {'command' => '/path/to/command'} }

      it { is_expected.to match '/path/to/command --puppeteerConfigFile' }
    end
  end
end
