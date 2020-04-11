# frozen_string_literal: true

require_relative 'syntrax/renderer'
require_relative 'syntrax/block'

module Jekyll
  module Diagrams
    module Syntrax
      Liquid::Template.register_tag(:syntrax, Block)
    end
  end
end
