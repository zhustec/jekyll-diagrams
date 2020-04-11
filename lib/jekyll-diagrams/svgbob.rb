# frozen_string_literal: true

require_relative 'svgbob/renderer'
require_relative 'svgbob/block'

module Jekyll
  module Diagrams
    module Svgbob
      Liquid::Template.register_tag(:svgbob, Block)
    end
  end
end
