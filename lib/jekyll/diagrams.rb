require 'jekyll'

module Jekyll
  module Diagrams
    module Utils
      def self.config_for(context, name)
        context.registers[:site].config.fetch('diagrams', {}).fetch(name, {})
      end
    end
  end
end

require 'jekyll/diagrams/graphviz'
require 'jekyll/diagrams/blockdiag'
