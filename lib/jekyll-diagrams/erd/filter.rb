# frozen_string_literal: true

module Jekyll
  module Diagrams
    module ErdFilter
      def as_erd(input)
        ErdRenderer.render(@context, input, 'erd')
      end
    end
  end
end
