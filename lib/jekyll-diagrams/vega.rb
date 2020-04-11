# frozen_string_literal: true

require_relative 'vega/renderer'
require_relative 'vega/block'
require_relative 'vega/filter'

module Jekyll
  module Diagrams
    %i[vega vegalite].each do |tag|
      Liquid::Template.register_tag(tag, VegaBlock)
    end
    
    Liquid::Template.register_filter(VegaFilter)
  end
end
