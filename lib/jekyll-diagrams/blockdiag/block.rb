# frozen_string_literal: true

module Jekyll
  module Diagrams
    %i[blockdiag seqdiag actdiag nwdiag rackdiag packetdiag].each do |name|
      const_set "#{name.capitalize}Block", Class.new(BasicBlock)
    end
  end
end
