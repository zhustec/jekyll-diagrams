# frozen_string_literal: true

module Jekyll
  module Diagrams
    module Utils
      module_function

      # Return configuration of Jekyll Diagrams
      #
      # @param context Liquid::Template
      # @return Configuration
      def configuration(context)
        site_config = context.registers[:site].config
        page_config = context.registers[:page]

        site_config.merge(page_config)
      end

      # @param context Liquid::Template
      def config_for(context, name)
        configuration(context).dig(Diagrams.config_name, name) || {}
      end

      # Return error mode in user configuration
      #
      # @param context Liquid::Template
      def error_mode(context)
        key = 'error_mode'
        config = configuration(context)

        liquid_mode = config.dig('liquid', key)
        custom_mode = config.dig(Diagrams.config_name, key)

        (custom_mode || liquid_mode || Diagrams.default_error_mode).to_sym
      end

      def handle_error(context, error)
        topic = Diagrams.logger_topic
        mode = error_mode(context)

        case mode
        when :lax
          ''
        when :warn
          Jekyll.logger.warn topic, error
          error
        when :strict
          Jekyll.logger.abort_with topic, error
        else
          raise Errors::UnkownErrorModeError, mode
        end
      end

      def vendor_path(file = '')
        File.join(File.expand_path('../../vendor', __dir__), file)
      end

      def run_jar(jar)
        "java -Djava.awt.headless=true -jar #{jar} "
      end

      def normalized_attrs(attrs, prefix:, sep: '=')
        attrs =
          case attrs
          when String
            attrs
          when Array
            attrs.join(prefix)
          when Hash
            attrs.map { |k, v| "#{k}#{sep}#{v}" }.join(prefix)
          end

        "#{prefix}#{attrs}"
      end

      def wrap_class(content, class_names)
        <<~CONTENT
          <div class='#{Diagrams.config_name} diagrams #{class_names}'>
            #{content}
          </div>
        CONTENT
      end
    end
  end
end
