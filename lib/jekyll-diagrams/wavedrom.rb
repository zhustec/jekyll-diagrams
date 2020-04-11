# frozen_string_literal: true

require_relative 'wavedrom/renderer'
require_relative 'wavedrom/block'
require_relative 'wavedrom/filter'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:wavedrom, WavedromBlock)
    Liquid::Template.register_filter(WavedromFilter)
  end
end
