# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::ErdRenderer do
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
  end

  describe '#build_command' do
    context 'when config is empty' do
      let(:config) { {} }

      it 'build command' do
        expect(renderer.build_command(config)).to eq 'erd --fmt=svg'
      end
    end

    context 'when switch is true' do
      let(:config) { { 'dot-entity' => true } }

      it 'build command' do
        expect(renderer.build_command(config)).to match '--dot-entity'
      end
    end

    context 'when switch is false' do
      let(:config) { { 'dot-entity' => false } }

      it 'build command' do
        expect(renderer.build_command(config)).not_to match '--dot-entity'
      end
    end

    context 'when options with value' do
      let(:config) { { 'edge' => 'compound' } }

      it 'build command' do
        expect(renderer.build_command(config)).to match '--edge'
      end
    end
  end
end
