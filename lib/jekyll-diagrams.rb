# frozen_string_literal: true

require 'jekyll'

require_relative 'jekyll-diagrams/errors'
require_relative 'jekyll-diagrams/utils'
require_relative 'jekyll-diagrams/rendering'

require_relative 'jekyll-diagrams/basic_renderer'
require_relative 'jekyll-diagrams/basic_block'

require_relative 'jekyll-diagrams/blockdiag'
require_relative 'jekyll-diagrams/erd'
require_relative 'jekyll-diagrams/graphviz'
require_relative 'jekyll-diagrams/mermaid'
require_relative 'jekyll-diagrams/nomnoml'
require_relative 'jekyll-diagrams/plantuml'
require_relative 'jekyll-diagrams/smcat'
require_relative 'jekyll-diagrams/svgbob'
require_relative 'jekyll-diagrams/syntrax'
require_relative 'jekyll-diagrams/vega'
require_relative 'jekyll-diagrams/wavedrom'

module Jekyll
  module Diagrams
    class << self
      def config_name
        'jekyll-diagrams'
      end

      def logger_topic
        'Jekyll Diagrams:'
      end

      def default_error_mode
        :warn
      end
    end
  end
end
