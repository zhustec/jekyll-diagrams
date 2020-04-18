# frozen_string_literal: true

require_relative 'vega/renderer'
require_relative 'vega/block'

module Jekyll
  module Diagrams
    %i[vega vegalite].each do |name|
      Liquid::Template.register_tag(name, const_get("#{name.capitalize}Block"))
    end
  end
end
