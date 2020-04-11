# frozen_string_literal: true

module Jekyll
  module Diagrams
    module WavedromFilter
      def as_wavedrom(input)
        WavedromRenderer.render(@context, input, 'wavedrom')
      end
    end
  end
end
