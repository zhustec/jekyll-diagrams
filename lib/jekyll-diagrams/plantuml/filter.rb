# frozen_string_literal: true

module Jekyll
  module Diagrams
    module PlantUMLFilter
      def as_plantuml(input)
        PlantUMLRenderer.render(@context, input, 'plantuml')
      end
    end
  end
end
