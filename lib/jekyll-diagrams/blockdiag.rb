# frozen_string_literal: true

require_relative 'blockdiag/renderer'
require_relative 'blockdiag/block'
require_relative 'blockdiag/filter'

module Jekyll
  module Diagrams
    %i[blockdiag seqdiag actdiag nwdiag rackdiag packetdiag].each do |tag|
      Liquid::Template.register_tag(tag, BlockdiagBlock)
    end
    
    Liquid::Template.register_filter(BlockdiagFilter)
  end
end
