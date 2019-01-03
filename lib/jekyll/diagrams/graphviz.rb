require 'open3'

module Jekyll
  module Diagrams
    class GraphvizBlock < Liquid::Block
      def initialize(tag_name, text, tokens)
        super
        @tag_name = tag_name
        @engine = text.strip
      end

      def render(context)
        config = context.registers[:site].config["diagrams"]

        @renderer = GraphvizRenderer.new(config["graphviz"])

        render_diagram(super)
      end

      private

      def render_diagram(code)
        code = case @tag_name
        when 'graph', 'digraph'
          "#@tag_name {\n#{code}\n}"
        when 'graphviz'
          code
        else
          raise "unknown liquid tag name: #{@tag_name}"
        end

        @renderer.render(code, @engine)
      end
    end

    class GraphvizRenderer
      DEFAULTS = {
        'engine'  => 'dot',
        'options' => '-Tsvg'
      }

      def initialize(config)
        @config = DEFAULTS.merge(config)
      end

      def render(code, engine = DEFAULTS['engine'])
        cmd = "#{@config['engine']} #{@config['options']}"
        svg, status = Open3.capture2(
          cmd,
          stdin_data: code,
          binmode: true
        )

        if !status.success?
          raise "Non-zero exit status '#{cmd}': #{status}"
        end

        svg.sub! /^<!DOCTYPE(([^>]|\n)*)>(\n?)/, ''
        svg.force_encoding 'UTF-8'

        "<div class='graphviz'>#{svg}</div>"
      end
    end
  end
end

%w(graphviz graph digraph).each do |tag|
  Liquid::Template.register_tag(tag, Jekyll::Diagrams::GraphvizBlock)
end
