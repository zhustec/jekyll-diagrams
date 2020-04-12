# frozen_string_literal: true

module Jekyll
  module Diagrams
    %i[blockdiag seqdiag actdiag nwdiag rackdiag packetdiag].each do |name|
      filter = "#{name.capitalize}Filter"

      Diagrams.const_set(filter, Module.new)
      Diagrams.const_get(filter).include(BasicFilter)
    end
  end
end
