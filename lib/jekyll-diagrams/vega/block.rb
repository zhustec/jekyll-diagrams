# frozen_string_literal: true

module Jekyll
  module Diagrams
    %w[vega vegalite].each do |name|
      const_set "#{name.capitalize}Block", Class.new(BasicBlock)
    end
  end
end
