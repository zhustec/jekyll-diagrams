# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::BasicBlock do
  before do
    stub_const('TestBlock', Class.new(described_class))
  end

  describe '.renderer_name' do
    subject { TestBlock.renderer_name }

    it { is_expected.to eq 'TestRenderer' }
  end

  describe '.renderer' do
    subject { TestBlock.renderer }

    context 'when the renderer is not found' do
      it 'raise an renderer not found error' do
        expect { TestBlock.renderer }.to raise_error(
          Jekyll::Diagrams::Errors::RendererNotFoundError
        )
      end
    end

    context 'when the renderer is found' do
      before { stub_const('TestRenderer', Class.new) }

      it { is_expected.to be TestRenderer }
    end
  end

  describe '#initialize' do
    before do
      Liquid::Template.register_tag(:test, TestBlock)
    end

    it 'parse inline options' do
      context = Liquid::Template.parse <<~CONTENT
        {% test a1="v1" a2="k2=v2" %}
          test
        {% endtest %}
      CONTENT

      # TODO: Get rid of this strange line
      options = context.root.nodelist.first
                       .instance_variable_get(:@inline_options)

      expect(options).to include('a1' => 'v1')
      expect(options).to include('a2' => 'k2=v2')
    end
  end

  describe '#render' do
    before do
      Liquid::Template.register_tag(:test, TestBlock)
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
