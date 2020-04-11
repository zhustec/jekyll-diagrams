# frozen_string_literal: true

module Jekyll
  module Diagrams
    module Utils
      class << self
        # Return configuration of Jekyll Diagrams
        #
        # @param context [Liquid::Context, :registers] Parsed context
        # @return Configuration
        def configuration(context)
          site_config = context.registers[:site].config
          page_config = context.registers[:page]

          site_config.merge(page_config)
        end

        def config_for(context, name)
          configuration(context).dig(Diagrams.config_name, name) || {}
        end

        def error_mode(context)
          key = 'error_mode'
          config = configuration(context)

          liquid_mode = config.dig('liquid', key)
          custom_mode = config.dig(Diagrams.config_name, key)

          (custom_mode || liquid_mode || :warn).to_sym
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
end
