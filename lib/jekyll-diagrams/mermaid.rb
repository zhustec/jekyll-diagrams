# frozen_string_literal: true

require_relative 'mermaid/renderer'
require_relative 'mermaid/block'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:mermaid, MermaidBlock)
  end
end
