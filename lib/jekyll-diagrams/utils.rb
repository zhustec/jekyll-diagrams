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

        (custom_mode || liquid_mode || :warn).to_sym
      end

      def handle_error(context, error)
        topic = Diagrams.logger_topic

        puts topic

        case error_mode(context)
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

      # Return file path under vendor path
      #
      # @param file [String] If not given, return directory path
      def vendor_path(file = '')
        File.join(File.expand_path('../../vendor', __dir__), file)
      end

      # @param jar [String] Jar path to run
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
    end
  end
end
