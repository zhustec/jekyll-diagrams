# frozen_string_literal: true

require_relative 'wavedrom/renderer'
require_relative 'wavedrom/block'

module Jekyll
  module Diagrams
    module Wavedrom
      Liquid::Template.register_tag(:wavedrom, Block)
    end
  end
end
