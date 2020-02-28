module Jekyll
  module Diagrams
    class Block < Liquid::Block
      include Renderer

      def render(context)
        svg = render_svg(super.to_s, read_config(context))
        wrap_class(svg)
      end

      def render_svg(content, config)
        raise 'Not Implemented'
      end

      def read_config(context)
        Util.config_for(context, block_name)
      end
      
      def wrap_class(content)
        "<div class='jekyll-diagrams diagrams #{block_name}'>#{content}</div>"
      end
    end
  end
end