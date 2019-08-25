require 'open3'

module Jekyll
  module Diagrams
    class GraphvizBlock < Liquid::Block
      DEFAULTS = {
        'engine'  => 'dot'
      }
      OPTIONS = '-T svg'

      def initialize(tag_name, text, tokens)
        super
        @tag_name = tag_name
      end

      def render(context)
        code = super.to_s
        config = DEFAULTS.merge(Utils.config_for(context, 'graphviz'))

        code = case @tag_name
        when 'graph', 'digraph'
          Jekyll.logger.warn "Warning:", "graph and digraph is depreated and will remove in the later version."
          Jekyll.logger.warn "", "Using graphviz instead."
          "#@tag_name {\n#{code}\n}"
        when 'graphviz'
          code
        end

        cmd = "#{config['engine']} #{OPTIONS} #{config['options']}"
        svg, status = Open3.capture2(cmd, stdin_data: code, binmode: true)

        if !status.success?
          raise "Non-zero exit status '#{cmd}': #{status}"
        end

        svg.sub!(/^<\?xml(([^>]|\n)*>\n?){4}/, '')
        wrap(svg.force_encoding('UTF-8'))
      end

      private

      def wrap(svg)
        "<div class='diagrams graphviz'>#{svg}</div>"
      end
    end
  end
end

%w(graphviz graph digraph).each do |tag|
  Liquid::Template.register_tag(tag, Jekyll::Diagrams::GraphvizBlock)
end
