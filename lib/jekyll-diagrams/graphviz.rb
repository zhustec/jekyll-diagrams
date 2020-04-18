# frozen_string_literal: true

require_relative 'graphviz/renderer'
require_relative 'graphviz/block'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:graphviz, GraphvizBlock)
  end
end
