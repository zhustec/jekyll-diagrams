# frozen_string_literal: true

module Jekyll
  module Diagrams
    module SMCatFilter
      def as_smcat(input)
        SMCatRenderer.render(@context, input, 'smcat')
      end
    end
  end
end
