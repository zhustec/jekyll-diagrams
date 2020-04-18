# frozen_string_literal: true

require_relative 'plantuml/renderer'
require_relative 'plantuml/block'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:plantuml, PlantUMLBlock)
  end
end
