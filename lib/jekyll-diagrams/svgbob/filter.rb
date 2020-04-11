# frozen_string_literal: true

module Jekyll
  module Diagrams
    module SvgbobFilter
      def as_svgbob(input)
        SvgbobRenderer.render(@context, input, 'svgbob')
      end
    end
  end
end
