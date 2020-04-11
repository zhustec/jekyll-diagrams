# frozen_string_literal: true

module Jekyll
  module Diagrams
    class PlantUMLRenderer < BasicRenderer
      XML_REGEX = /^<\?xml([^>]|\n)*>\n?/.freeze

      def render_svg(code, config)
        command = build_command(config)

        svg = render_with_stdin_stdout(command, code)
        svg.sub!(XML_REGEX, '')
      end

      def build_command(_config)
        jar = Utils.vendor_path('plantuml.1.2020.1.jar')

        options = +Utils.run_jar(jar)
        options << ' -tsvg -pipe'
      end
    end
  end
end
