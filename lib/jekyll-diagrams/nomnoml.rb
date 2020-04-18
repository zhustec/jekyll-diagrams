# frozen_string_literal: true

require_relative 'nomnoml/renderer'
require_relative 'nomnoml/block'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:nomnoml, NomnomlBlock)
  end
end
