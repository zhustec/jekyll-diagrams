# frozen_string_literal: true

module Jekyll
  module Diagrams
    class GraphvizBlock < Block
      CONFIGRATIONS = {
        'K' => 'default_layout',
        'G' => 'graph_attributes',
        'N' => 'node_attributes',
        'E' => 'edge_attributes'
      }.freeze

      XML_REGEX = /^<\?xml(([^>]|\n)*>\n?){2}/ # avoid expensive recreation of regexp

      def render_svg(code, config)
        command = build_command(config)

        svg = render_with_stdin_stdout(command, code)
        svg.sub!(XML_REGEX, '').force_encoding(config.fetch('encoding', 'utf-8')) # allow overriding encoding of output
      end

      def build_command(config)
        command = +'dot -Tsvg'

        CONFIGRATIONS.each do |prefix, conf|
          next unless config.key?(conf)

          attrs = config[conf]

          attrs = case attrs
                  when String
                    attrs
                  when Array
                    attrs.join(" -#{prefix}")
                  when Hash
                    attrs.map { |k, v| "#{k}=#{v}" }.join(" -#{prefix}")
                  end

          command << " -#{prefix}#{attrs}"
        end

        command
      end
    end
  end
end

Liquid::Template.register_tag(:graphviz, Jekyll::Diagrams::GraphvizBlock)
