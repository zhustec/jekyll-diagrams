# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::SvgbobRenderer do
  subject(:renderer) do
    described_class.new(Liquid::ParseContext.new, '')
  end

  describe '#render_svg' do
    it 'call build_command' do
      allow(renderer).to receive(:build_command)
      allow(renderer).to receive(:render_with_stdin_stdout)

      renderer.render_svg('', {})

      expect(renderer).to have_received(:render_with_stdin_stdout)
    end
  end

  describe '#build_command' do
    context 'when config is empty' do
      let(:config) { {} }

      it 'build command' do
        expect(renderer.build_command(config)).to eq 'svgbob'
      end
    end

    context 'when options with value' do
      let(:config) { { 'scale' => '2' } }

      it 'build command' do
        expect(renderer.build_command(config)).to match '--scale 2'
      end
    end
  end
end
