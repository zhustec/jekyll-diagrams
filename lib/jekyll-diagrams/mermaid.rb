# frozen_string_literal: true

require_relative 'mermaid/renderer'
require_relative 'mermaid/block'

module Jekyll
  module Diagrams
    module Mermaid
      Liquid::Template.register_tag(:mermaid, Block)
    end
  end
end
