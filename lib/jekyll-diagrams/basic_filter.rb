# frozen_string_literal: true

module Jekyll
  module Diagrams
    module BasicFilter
      def self.included(filter)
        # Jekyll::...::GraphvizFilter -> 'Graphviz'
        base = filter.name.split('::').last.sub(/Filter$/, '')
        # 'Graphviz' -> 'GraphvizRenderer'
        renderer_name = "#{base}Renderer"
        # 'graphviz'
        tag = base.downcase

        # Examples
        #
        #   define_method 'as_graphviz' do |inout|
        #     renderer = Diagrams.const_get('GraphvizRenderer')
        #     renderer.render(@context, input, tag)
        #   end
        #
        filter.module_eval do
          define_method "as_#{tag}" do |input|
            renderer = Diagrams.const_get(renderer_name)
            renderer.render(@context, input, tag)
          end
        end
      end
    end
  end
end
