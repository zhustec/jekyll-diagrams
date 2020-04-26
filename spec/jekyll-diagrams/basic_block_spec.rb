# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::BasicBlock do
  before do
    stub_const('TestBlock', Class.new(described_class))
  end

  describe '.renderer_name' do
    it 'return the renderer name matching the block' do
      expect(TestBlock.renderer_name).to eq 'TestRenderer'
    end
  end

  describe '.renderer' do
    context 'when the renderer is not found' do
      it 'raise an renderer not found error' do
        expect { TestBlock.renderer }.to raise_error(
          Jekyll::Diagrams::Errors::RendererNotFoundError
        )
      end
    end

    context 'when the renderer is found' do
      before { stub_const('TestRenderer', Class.new) }

      it 'return the renderer matching the block' do
        expect(TestBlock.renderer).to be TestRenderer
      end
    end
  end

  describe '#render' do
    before do
      Liquid::Template.register_tag(:test, TestBlock)
    end

    context 'when inline options is not valid' do
      before do
        allow(Jekyll::Diagrams::Utils).to receive(:handle_error)

        template = Liquid::Template.parse <<~CONTENT
          {% test a1=v1=2 %} test {% endtest %}
        CONTENT

        template.render(context_with_config)
      end

      it 'raise inline options syntax error' do
        expect(Jekyll::Diagrams::Utils).to have_received(:handle_error).with(
          anything, kind_of(Jekyll::Diagrams::Errors::InlineOptionsSyntaxError)
        )
      end
    end

    context 'when inline options is valid' do
      before do
        allow(described_class).to receive_message_chain(:renderer, :render)
        allow(Jekyll::Diagrams::Utils).to receive(:parse_inline_options)

        template = Liquid::Template.parse <<~CONTENT
          {% test a1=v1 a2="v2" a3="k3 v3" %} test {% endtest %}
        CONTENT

        template.render(context_with_config)
      end

      it 'call Utils.parse_inline_options' do
        expect(Jekyll::Diagrams::Utils).to have_received(
          :parse_inline_options
        ).with('a1=v1 a2="v2" a3="k3 v3"')
      end
    end

    context 'when the renderer is not found' do
      it 'raise renderer not found error' do
        allow(Jekyll::Diagrams::Utils).to receive(:handle_error)

        content = '{% test %}test{% endtest %}'
        context = Liquid::Template.parse(content)
        context.render(context_with_config)

        expect(Jekyll::Diagrams::Utils).to have_received(:handle_error)
      end
    end

    context 'when the renderer is found' do
      before do
        renderer = Class.new do
          def self.render(_context, input, _name)
            input
          end
        end

        stub_const('TestRenderer', renderer)
      end

      it 'render the content with the renderer' do
        content = '{% test %}test{% endtest %}'
        context = Liquid::Template.parse(content)

        expect(context.render(context_with_config)).to eq 'test'
      end
    end
  end
end
