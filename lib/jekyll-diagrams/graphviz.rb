module Jekyll
  module Diagrams
    class GraphvizBlock < Block
      CONFIGRATIONS = {
        'K' => 'default_layout',
        'G' => 'graph_attribute',
        'N' => 'node_attribute',
        'E' => 'edge_attribute'
      }.freeze

      def render_svg(code, config)
        command = build_command(config)

        svg = render_with_stdin_stdout(command, code)
        svg.sub!(/^<\?xml(([^>]|\n)*>\n?){2}/, '')
      end

      def build_command(config)
        command = 'dot -Tsvg'

        CONFIGRATIONS.each do |prefix, conf|
          next unless config.has_key?(conf)

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