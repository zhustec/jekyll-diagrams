# frozen_string_literal: true

module Jekyll
  module Diagrams
    module SyntraxFilter
      def as_syntrax(input)
        SyntraxRenderer.render(@context, input, 'syntrax')
      end
    end
  end
end
