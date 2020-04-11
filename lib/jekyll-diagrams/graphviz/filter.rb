# frozen_string_literal: true

module Jekyll
  module Diagrams
    module GraphvizFilter
      def as_graphviz(input)
        GraphvizRenderer.render(@context, input, 'graphviz')
      end
    end
  end
end
