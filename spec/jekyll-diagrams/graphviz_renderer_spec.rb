# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::GraphvizRenderer do
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
      subject { renderer.build_command(config) }

      let(:config) { {} }

      it { is_expected.to eq 'dot -Tsvg' }
    end

    context 'with attributes included in config' do
      it 'call Utils.normalized_attrs to normalize attributes' do
        allow(Jekyll::Diagrams::Utils).to receive(:normalized_attrs)
          .and_return('')

        renderer.build_command({ 'graph_attributes' => 'attrs' })

        expect(Jekyll::Diagrams::Utils).to have_received(:normalized_attrs)
      end
    end
  end
end
