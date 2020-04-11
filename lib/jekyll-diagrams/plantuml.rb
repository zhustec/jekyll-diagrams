# frozen_string_literal: true

require_relative 'plantuml/renderer'
require_relative 'plantuml/block'
require_relative 'plantuml/filter'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:plantuml, PlantUMLBlock)
    Liquid::Template.register_filter(PlantUMLFilter)
  end
end
