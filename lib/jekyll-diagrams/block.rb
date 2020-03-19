# frozen_string_literal: true

module Jekyll
  module Diagrams
    class Block < Liquid::Block
      include Util

      def render(context)
        svg = render_svg(super.to_s, read_config(context))
        wrap_class(svg)
      end

      def render_svg(_, _)
        ''
      end

      def read_config(context)
        config_for(context, block_name)
      end

      def wrap_class(content)
        "<div class='jekyll-diagrams diagrams #{block_name}'>#{content}</div>"
      end
    end
  end
end
