# frozen_string_literal: true

module Jekyll
  module Diagrams
    class BasicBlock < Liquid::Block
      def render(context)
        self.class.renderer.render(
          context, super.to_s, self.class.diagram_name
        )
      rescue Errors::RendererNotFoundError => e
        Utils.handle_error(context, e)
      end

      class << self
        def renderer
          @renderer ||= Diagrams.const_get(renderer_name)
        rescue NameError => e
          # uninitialized constant SomeConstant
          raise Errors::RendererNotFoundError, e.message.split(' ').last
        end

        def renderer_name
          @renderer_name ||=
            "#{name.split('::').last.sub(/Block$/, '')}Renderer"
        end

        def diagram_name
          @diagram_name ||=
            name.split('::').last.sub(/Block$/, '').downcase
        end
      end
    end
  end
end
