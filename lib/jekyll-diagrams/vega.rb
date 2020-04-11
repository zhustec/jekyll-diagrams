# frozen_string_literal: true

require_relative 'vega/renderer'
require_relative 'vega/block'

module Jekyll
  module Diagrams
    module Vega
      %i[vega vegalite].each do |tag|
        Liquid::Template.register_tag(tag, Block)
      end
    end
  end
end
