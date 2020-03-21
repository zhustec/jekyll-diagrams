# frozen_string_literal: true

module Jekyll
  module Diagrams
    class PlantUMLBlock < Block
      XML_REGEX = /^<\?xml([^>]|\n)*>\n?/.freeze

      def render_svg(code, config)
        command = build_command(config)

        svg = render_with_stdin_stdout(command, code)
        svg.sub!(XML_REGEX, '')
      end

      def build_command(_config)
        jar = Diagrams.vendor_path('plantuml.1.2020.1.jar')

        options = +Diagrams.run_jar(jar)
        options << ' -tsvg -pipe'
      end
    end
  end
end

Liquid::Template.register_tag(:plantuml, Jekyll::Diagrams::PlantUMLBlock)
