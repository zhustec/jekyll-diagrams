# frozen_string_literal: true

module Jekyll
  module Diagrams
    class PlantUMLRenderer < BasicRenderer
      DEFAULT_PLANTUML_JAR = 'plantuml.1.2020.1.jar'

      XML_REGEX = /^<\?xml([^>]|\n)*>\n?/.freeze
      INCLUDE_PATH_CONFIG_KEY = "include_path"
      PLANTUML_JAR_CONFIG_KEY = "jar_path"

      def render_svg(code, config)
        command = build_command(config)

        svg = render_with_stdin_stdout(command, code)
        svg.sub!(XML_REGEX, '')
      end

      def build_command(config)
        jar = if config.has_key? PLANTUML_JAR_CONFIG_KEY
          if config[PLANTUML_JAR_CONFIG_KEY].is_a? String
            base_dir = Jekyll.configuration({})['source']
            File.expand_path(File.join(base_dir,config[PLANTUML_JAR_CONFIG_KEY]))
          else
            File.expand_path(config[PLANTUML_JAR_CONFIG_KEY]["absolute"])
          end
        else
          Utils.vendor_path(DEFAULT_PLANTUML_JAR)
        end
        options = +Utils.run_jar(jar, build_jvm_args(config))
        options << ' -tsvg -pipe'
      end

      private

      def build_jvm_args(config)
        if config.has_key? INCLUDE_PATH_CONFIG_KEY
          base_dir = Jekyll.configuration({})['source']
           {"plantuml.include.path" => File.join(base_dir,config[INCLUDE_PATH_CONFIG_KEY])}
        else
          {}
        end
      end
    end
  end
end
