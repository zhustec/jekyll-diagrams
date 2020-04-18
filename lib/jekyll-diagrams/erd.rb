# frozen_string_literal: true

require_relative 'erd/renderer'
require_relative 'erd/block'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:erd, ErdBlock)
  end
end
