# frozen_string_literal: true

module Jekyll
  module Diagrams
    class BasicRenderer
      include Rendering

      def self.render(context, content, options = {})
        new(context, content, options).render
      end

      def initialize(context, content, options = {})
        @context = context
        @content = content
        @inline_options = options.fetch(:inline_options, {})
        @diagram_name = options.fetch(:diagram_name) do
          self.class.name.split('::').last.sub(/Renderer$/, '').downcase
        end
      end

      def render
        output = render_svg(@content, configuration)
        Utils.wrap_class(output, @diagram_name)
      rescue StandardError => error
        Utils.wrap_class(Utils.handle_error(@context, error), @diagram_name)
      end

      private

      def configuration
        Utils.config_for(@context, @diagram_name).merge(@inline_options)
      end

      def render_svg(_code, _config)
        raise NotImplementedError
      end
    end
  end
end
