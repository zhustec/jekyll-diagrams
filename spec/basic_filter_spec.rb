# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Jekyll::Diagrams::BasicFilter do
  before do
    stub_const('TestFilter', Module.new)
    TestFilter.include(described_class)
  end

  describe '.included' do
    context 'when included by a filter module' do
      it 'define a module method `diagram_name`' do
        expect(TestFilter.methods).to include :diagram_name
      end

      it 'define a module method `renderer_name`' do
        expect(TestFilter.methods).to include :renderer_name
      end

      it 'define a module method `renderer`' do
        expect(TestFilter.methods).to include :renderer
      end

      it 'define a instance method `as_test`' do
        expect(TestFilter.instance_methods).to include :as_test
      end
    end

    describe '.diagrams_name' do
      it 'return diagrams name' do
        expect(TestFilter.diagram_name).to eq 'test'
      end
    end

    describe '.renderer_name' do
      it 'return renderer name' do
        expect(TestFilter.renderer_name).to eq 'TestRenderer'
      end
    end
  end

  # describe '#render_svg' do
  #   it 'inject method when included' do
  #     expect(TestFilter.instance_methods).to include :as_test
  #   end

  #   it 'render' do
  #     Liquid::Template.register_filter(TestFilter)

  #     template = Liquid::Template.parse(
  #       <<~CONTENT
  #         {% capture content %}test{% endcapture %}
  #         {{ content | as_test }}
  #       CONTENT
  #     )

  #     expect(template.render).to match 'test'
  #   end
  # end
end
