# frozen_string_literal: true

require_relative 'plantuml/renderer'
require_relative 'plantuml/block'

module Jekyll
  module Diagrams
    module PlantUML
      Liquid::Template.register_tag(:plantuml, Block)
    end
  end
end
