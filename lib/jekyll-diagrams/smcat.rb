# frozen_string_literal: true

require_relative 'smcat/renderer'
require_relative 'smcat/block'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:smcat, SMCatBlock)
  end
end
