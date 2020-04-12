# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::BasicBlock do
  before do
    stub_const('TestBlock', Class.new(described_class))
  end

  describe '.renderer' do
    context 'when the renderer is not found' do
      it 'raise an RendererNotFoundError error' do
        error = Jekyll::Diagrams::Errors::RendererNotFoundError

        expect { TestBlock.renderer }.to raise_error error
      end
    end

    context 'when the renderer is found' do
      let :renderer do
        Class.new do
          def self.render(_context, input, _name)
            input
          end
        end
      end

      before do
        stub_const('Jekyll::Diagrams::TestRenderer', renderer)
      end

      it 'return the renderer class' do
        expect(TestBlock.renderer).to eq renderer
      end
    end
  end

  describe '.diagrams_name' do
    subject { TestBlock.diagram_name }

    it { is_expected.to eq 'test' }
  end

  describe '.renderer_name' do
    subject { TestBlock.renderer_name }

    it { is_expected.to eq 'TestRenderer' }
  end

  describe '#render' do
    context 'when the renderer is found' do
      before do
        renderer = Class.new do
          def self.render(_context, input, _name)
            input
          end
        end

        stub_const('Jekyll::Diagrams::TestRenderer', renderer)

        Liquid::Template.register_tag(:test, TestBlock)
      end

      it 'render the content with the renderer' do
        content = '{% test %}test{% endtest %}'
        context = Liquid::Template.parse(content)

        expect(context.render).to eq 'test'
      end
    end
  end
end
