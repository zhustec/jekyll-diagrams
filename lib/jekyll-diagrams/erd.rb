# frozen_string_literal: true

require_relative 'erd/renderer'
require_relative 'erd/block'
require_relative 'erd/filter'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:erd, ErdBlock)
    Liquid::Template.register_filter(ErdFilter)
  end
end
