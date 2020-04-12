# frozen_string_literal: true

require_relative 'graphviz/renderer'
require_relative 'graphviz/block'
require_relative 'graphviz/filter'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:graphviz, GraphvizBlock)
    Liquid::Template.register_filter(GraphvizFilter)
  end
end
