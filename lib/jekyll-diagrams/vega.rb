# frozen_string_literal: true

require_relative 'vega/renderer'
require_relative 'vega/block'
require_relative 'vega/filter'

module Jekyll
  module Diagrams
    %i[vega vegalite].each do |tag|
      Liquid::Template.register_tag(tag, const_get("#{tag.capitalize}Block"))
      Liquid::Template.register_filter(const_get("#{tag.capitalize}Filter"))
    end
  end
end
