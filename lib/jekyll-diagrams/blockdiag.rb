# frozen_string_literal: true

require_relative 'blockdiag/renderer'
require_relative 'blockdiag/block'
require_relative 'blockdiag/filter'

module Jekyll
  module Diagrams
    %i[blockdiag seqdiag actdiag nwdiag rackdiag packetdiag].each do |tag|
      Liquid::Template.register_tag(tag, const_get("#{tag.capitalize}Block"))
      Liquid::Template.register_filter(const_get("#{tag.capitalize}Filter"))
    end
  end
end
