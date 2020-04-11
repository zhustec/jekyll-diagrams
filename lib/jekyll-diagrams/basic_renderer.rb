# frozen_string_literal: true

module Jekyll
  module Diagrams
    class BasicRenderer
      include Rendering

      class << self
        def render(context, content, diagram = nil)
          new(context, content, diagram).render
        end
      end

      def initialize(context, content, diagram = nil)
        @context = context
        @content = content
        @block_name = diagram || self.class.name.split('::').last
                                     .sub(/Renderer$/, '').downcase
      end

      def render
        config = Utils.config_for(@context, @block_name)

        output = render_svg(@content, config)
        wrap_class(output)
      rescue StandardError => e
        wrap_class(Utils.handle_error(@context, e))
      end

      private

      def render_svg(_code, _config)
        raise NotImplementedError
      end

      def wrap_class(content)
        <<~CONTENT
          <div class='jekyll-diagrams diagrams #{@block_name}'>
            #{content}
          </div>"
        CONTENT
      end
    end
  end
end
