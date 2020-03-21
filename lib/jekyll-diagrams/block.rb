# frozen_string_literal: true

module Jekyll
  module Diagrams
    class Block < Liquid::Block
      include Rendering

      def render(context)
        code = super.to_s
        config = Diagrams.config_for(context, block_name)
        global_config = Diagrams.config_for(context, 'global')
        error_mode = global_config.fetch('error_mode', :raise).to_sym

        output = render_svg(code, config)
        wrap_class(output)
      rescue StandardError => e
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
        # require 'pry'
        # binding.pry
        case mode
        when :raise
          raise error
        when :skip
          ''
        when :warn
          handle_warn(error, mode)
          ''
        end
      end

      def handle_warn(error, _mode)
        case error
        when ProgramNotFoundError
          program = error.message.split(' ')[0]

          Jekyll.logger.warn 'Jekyll Diagrams', <<~MESSAGE
            Executable Not found: #{program}, you need to install it first
          MESSAGE
        when RenderingFailedError
          Jekyll.logger.warn 'Jekyll Diagrams', <<~MESSAGE
            Render Failed: #{error.message}
          MESSAGE
        end
      end
    end
  end
end
