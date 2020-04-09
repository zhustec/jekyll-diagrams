# frozen_string_literal: true

require 'jekyll'

module Jekyll
  module Diagrams
    class << self
      # Return configuration of Jekyll Diagrams
      #
      # @param context [Liquid::Context, :registers] Parsed context
      # @return Configuration
      def configuration(context)
        site_config = context.registers[:site].config
        page_config = context.registers[:page]

        site_config.merge(page_config)
      end

      def config_for(context, name)
        configuration(context).dig(config_name, name) || {}
      end

      def error_mode(context)
        liquid_mode = configuration(context).dig('liquid', 'error_mode')
        custom_mode = configuration(context).dig(config_name, 'error_mode')

        (custom_mode || liquid_mode || :warn).to_sym
      end

      # Return file path under vendor path
      #
      # @param file [String] If not given, return directory path
      def vendor_path(file = '')
        File.join(File.expand_path('../vendor', __dir__), file)
      end

      # @param jar [String] Jar path to run
      def run_jar(jar)
        "java -Djava.awt.headless=true -jar #{jar} "
      end

      def normalized_attrs(attrs, prefix:, sep: '=')
        attrs =
          case attrs
          when String
            attrs
          when Array
            attrs.join(prefix)
          when Hash
            attrs.map { |k, v| "#{k}#{sep}#{v}" }.join(prefix)
          end

        "#{prefix}#{attrs}"
      end

      private

      def config_name
        'jekyll-diagrams'
      end
    end
  end
end

require_relative 'jekyll-diagrams/errors'
require_relative 'jekyll-diagrams/rendering'
require_relative 'jekyll-diagrams/block'

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
