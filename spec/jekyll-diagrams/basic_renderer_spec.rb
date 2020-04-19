# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::BasicRenderer do
  describe '.render' do
    it 'create an instance and render' do
      allow(described_class).to receive_message_chain(:new, :render)

      described_class.render('context', 'content', { key: 'value' })

      expect(described_class).to have_received(:new).with(
        'context', 'content', { key: 'value' }
      )
    end
  end

  describe '#render' do
    it 'call render_svg to render' do
      renderer = described_class.new('context', 'content')

      allow(renderer).to receive(:render_svg)
      allow(renderer).to receive(:configuration)
      allow(Jekyll::Diagrams::Utils).to receive(:wrap_class)

      renderer.render

      expect(renderer).to have_received(:render_svg)
    end

    context 'when rendering successfully' do
      it 'wrap the output' do
        renderer = described_class.new(context_with_config, '')

        allow(renderer).to receive(:render_svg)
        allow(Jekyll::Diagrams::Utils).to receive(:wrap_class)

        renderer.render

        expect(Jekyll::Diagrams::Utils).to have_received(:wrap_class)
      end
    end

    context 'when rendering failed' do
      it 'handle the error and wrap the return value' do
        renderer = described_class.new(context_with_config, '')

        allow(renderer).to receive(:render_svg).and_raise
        allow(Jekyll::Diagrams::Utils).to receive(:handle_error)
        allow(Jekyll::Diagrams::Utils).to receive(:wrap_class)

        renderer.render

        expect(Jekyll::Diagrams::Utils).to have_received(:handle_error)
        expect(Jekyll::Diagrams::Utils).to have_received(:wrap_class)
      end
    end
  end

  describe '#render_svg' do
    it 'raise not implemented error' do
      renderer = described_class.new('context', 'content')

      expect do
        renderer.send(:render_svg, '', '')
      end.to raise_error NotImplementedError
    end
  end
end
