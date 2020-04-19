# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::NomnomlRenderer do
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

      it { is_expected.to eq 'nomnoml' }
    end
  end
end
