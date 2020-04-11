# frozen_string_literal: true

require_relative 'smcat/renderer'
require_relative 'smcat/block'

module Jekyll
  module Diagrams
    module SMCat
      Liquid::Template.register_tag(:smcat, Block)
    end
  end
end
