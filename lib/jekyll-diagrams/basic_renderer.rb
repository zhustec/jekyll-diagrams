# frozen_string_literal: true

module Jekyll
  module Diagrams
    class BasicRenderer
      include Rendering

      class << self
        def render(context, content, block_name)
          new(context, content, block_name).render
        end
      end

      def initialize(context, content, block_name)
        @context = context
        @content = content
        @block_name = block_name
      end

      def render
        config = Utils.config_for(@context, @block_name)

        output = render_svg(@content, config)
        wrap_class(output)
      rescue StandardError => e
        error_mode = Utils.error_mode(@context)

        output = handle_error(e, error_mode)
        wrap_class(output)
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

      def handle_error(error, mode)
        topic = Diagrams.logger_topic

        case mode
        when :lax
          Jekyll.logger.info topic, error
          Jekyll.logger.info '', 'skip'
          ''
        when :warn
          Jekyll.logger.warn topic, error
          error
        when :strict
          Jekyll.logger.abort_with topic, error
        end
      end
    end
  end
end
