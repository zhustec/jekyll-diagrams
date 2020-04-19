# frozen_string_literal: true

module Jekyll
  module Diagrams
    class BasicBlock < Liquid::Block
      def self.renderer
        @renderer ||= const_get(renderer_name)
      rescue NameError => error
        raise Errors::RendererNotFoundError, error.message.split(' ').last
      end

      def self.renderer_name
        @renderer_name ||= name.sub(/Block$/, 'Renderer')
      end

      def render(context)
        self.class.renderer.render(
          context, super.to_s, {
            diagram_name: self.class.name.split('::').last
                              .sub(/Block$/, '').downcase
          }
        )
      rescue Errors::RendererNotFoundError => error
        Utils.handle_error(context, error)
      end
    end
  end
end
