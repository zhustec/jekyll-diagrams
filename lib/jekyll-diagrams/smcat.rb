# frozen_string_literal: true

require_relative 'smcat/renderer'
require_relative 'smcat/block'
require_relative 'smcat/filter'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:smcat, SMCatBlock)
    Liquid::Template.register_filter(SMCatFilter)
  end
end
