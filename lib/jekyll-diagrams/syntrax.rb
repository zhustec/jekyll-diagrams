# frozen_string_literal: true

require_relative 'syntrax/renderer'
require_relative 'syntrax/block'
require_relative 'syntrax/filter'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:syntrax, SyntraxBlock)
    Liquid::Template.register_filter(SyntraxFilter)
  end
end
