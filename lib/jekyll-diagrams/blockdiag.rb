# frozen_string_literal: true

require_relative 'blockdiag/renderer'
require_relative 'blockdiag/block'

module Jekyll
  module Diagrams
    %i[blockdiag seqdiag actdiag nwdiag rackdiag packetdiag].each do |name|
      Liquid::Template.register_tag(name, const_get("#{name.capitalize}Block"))
    end
  end
end
