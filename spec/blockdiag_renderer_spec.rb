# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::BlockdiagRenderer do
  subject(:renderer) do
    described_class.new(Liquid::ParseContext.new, '')
  end

  describe '#build_command' do
    context 'when config is empty' do
      let(:config) { {} }

      it 'build command' do
        expect(renderer.build_command(config)).to match '-T svg --nodoctype'
      end
    end

    context 'when switch is true' do
      let(:config) { { 'antialias' => true } }

      it 'build command' do
        expect(renderer.build_command(config)).to match '--antialias'
      end
    end

    context 'when switch is false' do
      let(:config) { { 'antialias' => false } }

      it 'build command' do
        expect(renderer.build_command(config)).not_to match '--antialias'
      end
    end

    context 'when options with value' do
      let(:config) { { 'size' => 3 } }

      it 'build command' do
        expect(renderer.build_command(config)).to match '--size=3'
      end
    end
  end
end
