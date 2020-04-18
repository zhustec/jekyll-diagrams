# frozen_string_literal: true

require_relative 'syntrax/renderer'
require_relative 'syntrax/block'

module Jekyll
  module Diagrams
    Liquid::Template.register_tag(:syntrax, SyntraxBlock)
  end
end
