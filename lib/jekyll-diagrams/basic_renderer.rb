# frozen_string_literal: true

module Jekyll
  module Diagrams
    class BasicRenderer
      include Rendering

      def self.render(context, content, name = nil)
        new(context, content, name).render
      end

      def initialize(context, content, name = nil)
        @context = context
        @content = content
        @name = name || self.class.name.split('::').last
                            .sub(/Renderer$/, '').downcase
      end

      def render
        config = Utils.config_for(@context, @name)
        output = render_svg(@content, config)
        Utils.wrap_class(output, @name)
      rescue StandardError => error
        Utils.wrap_class(Utils.handle_error(@context, error), @name)
      end

      private

      def render_svg(_code, _config)
        raise NotImplementedError
      end
    end
  end
end
