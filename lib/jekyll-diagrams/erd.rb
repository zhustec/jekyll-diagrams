# frozen_string_literal: true

require_relative 'erd/renderer'
require_relative 'erd/block'

module Jekyll
  module Diagrams
    module Erd
      Liquid::Template.register_tag(:erd, Block)
    end
  end
end
