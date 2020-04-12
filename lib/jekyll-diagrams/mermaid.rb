# frozen_string_literal: true

require_relative 'mermaid/renderer'
require_relative 'mermaid/block'
require_relative 'mermaid/filter'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:mermaid, MermaidBlock)
    Liquid::Template.register_filter(MermaidFilter)
  end
end
