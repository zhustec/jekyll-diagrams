# frozen_string_literal: true

require_relative 'blockdiag/renderer'
require_relative 'blockdiag/block'

module Jekyll
  module Diagrams
    module Blockdiag
      %i[blockdiag seqdiag actdiag nwdiag rackdiag packetdiag].each do |tag|
        Liquid::Template.register_tag(tag, Block)
      end
    end
  end
end
