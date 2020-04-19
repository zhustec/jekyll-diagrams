# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::VegaRenderer do
  subject(:renderer) do
    described_class.new(Liquid::ParseContext.new, '')
  end

  describe '#render_svg' do
    it 'call build_command' do
      allow(renderer).to receive(:build_command)
      allow(renderer).to receive(:render_with_stdin_stdout).and_return(+'')

      renderer.render_svg('', {})

      expect(renderer).to have_received(:render_with_stdin_stdout)
    end

    context 'with vegalite' do
      it 'call rendering twice' do
        allow(renderer).to receive(:build_command)
        allow(renderer).to receive(:render_with_stdin_stdout).and_return(+'')

        renderer.instance_variable_set(:@diagram, 'vegalite')
        renderer.render_svg('', {})

        expect(renderer).to have_received(:render_with_stdin_stdout).twice
      end
    end
  end

  describe '#build_command' do
    context 'when config is empty' do
      subject { renderer.build_command(config) }

      let(:config) { {} }

      it { is_expected.to eq 'vg2svg' }
    end
  end
end
