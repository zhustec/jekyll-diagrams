# frozen_string_literal: true

module Jekyll
  module Diagrams
    module BlockdiagFilter
      %i[blockdiag seqdiag actdiag nwdiag rackdiag packetdiag].each do |filter|
        define_method "as_#{filter}" do |input|
          BlockdiagRenderer.render(@context, input, filter)
        end
      end
    end
  end
end
