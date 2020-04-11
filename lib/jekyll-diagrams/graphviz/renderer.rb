# frozen_string_literal: true

module Jekyll
  module Diagrams
    class GraphvizRenderer < BasicRenderer
      XML_REGEX = /^<\?xml(([^>]|\n)*>\n?){2}/.freeze
      CONFIGRATIONS = {
        'K' => 'default_layout',
        'G' => 'graph_attributes',
        'N' => 'node_attributes',
        'E' => 'edge_attributes'
      }.freeze

      def render_svg(code, config)
        command = build_command(config)

        svg = render_with_stdin_stdout(command, code).force_encoding(
          config.fetch('encoding', 'utf-8')
        )

        svg.sub!(XML_REGEX, '')
      end

      def build_command(config)
        command = +'dot -Tsvg'

        CONFIGRATIONS.each do |prefix, conf|
          next unless config.key?(conf)

          command << Utils.normalized_attrs(
            config[conf],
            prefix: " -#{prefix}"
          )
        end

        command
      end
    end
  end
end
