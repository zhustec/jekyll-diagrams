# frozen_string_literal: true

require_relative 'nomnoml/renderer'
require_relative 'nomnoml/block'
require_relative 'nomnoml/filter'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:nomnoml, NomnomlBlock)
    Liquid::Template.register_filter(NomnomlFilter)
  end
end
