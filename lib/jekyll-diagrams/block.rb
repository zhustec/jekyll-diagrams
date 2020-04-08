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

        handle_error(e, error_mode)
      end

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

      private

      def handle_error(error, mode)
        case mode
        when :lax
          ''
        when :strict
          raise error
        when :warn
          Jekyll.logger.warn 'Jekyll Diagrams:', error.message
          error.message
        end
      end
    end
  end
end
