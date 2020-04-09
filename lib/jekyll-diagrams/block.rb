# frozen_string_literal: true

module Jekyll
  module Diagrams
    class Block < Liquid::Block
      include Rendering

      def render(context)
        config = Diagrams.config_for(context, block_name)

        output = render_svg(super.to_s, config)
        wrap_class(output)
      rescue StandardError => e
        error_mode = Diagrams.error_mode(context)

        output = handle_error(e, error_mode)
        wrap_class(output)
      end

      private

      def render_svg(_code, _config)
        ''
      end

      def wrap_class(content)
        <<~CONTENT
          <div class='jekyll-diagrams diagrams #{block_name}'>
            #{content}
          </div>"
        CONTENT
      end

      def handle_error(error, mode)
        topic = 'Jekyll Diagrams:'
        msg = error.message

        case mode
        when :lax
          Jekyll.logger.info topic, msg
          ''
        when :warn
          Jekyll.logger.warn topic, msg
          msg
        when :strict
          Jekyll.logger.abort_with topic, msg
        end
      end
    end
  end
end
