# frozen_string_literal: true

module Jekyll
  module Diagrams
    module VegaFilter
      %i[vega vegalite].each do |filter|
        define_method "as_#{filter}" do |input|
          VegaRenderer.render(@context, input, filter)
        end
      end
    end
  end
end
