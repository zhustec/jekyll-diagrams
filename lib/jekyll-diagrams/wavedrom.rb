# frozen_string_literal: true

require_relative 'wavedrom/renderer'
require_relative 'wavedrom/block'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:wavedrom, WavedromBlock)
  end
end
