# frozen_string_literal: true

module Jekyll
  module Diagrams
    module MermaidFilter
      def as_mermaid(input)
        MermaidRenderer.render(@context, input, 'mermaid')
      end
    end
  end
end
