# frozen_string_literal: true

module Jekyll
  module Diagrams
    module NomnomlFilter
      def as_nomnoml(input)
        NomnomlRenderer.render(@context, input, 'nomnoml')
      end
    end
  end
end
