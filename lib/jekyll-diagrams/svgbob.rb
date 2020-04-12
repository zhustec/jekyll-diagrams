# frozen_string_literal: true

require_relative 'svgbob/renderer'
require_relative 'svgbob/block'
require_relative 'svgbob/filter'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:svgbob, SvgbobBlock)
    Liquid::Template.register_filter(SvgbobFilter)
  end
end
