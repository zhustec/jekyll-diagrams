module Jekyll
  module Diagrams
    class PlantUMLBlock < Block
      def render_svg(code, config)
        svg = render_with_stdin_stdout(build_command(config), code)
        svg.sub!(/^<\?xml([^>]|\n)*>\n?/, '')
      end

      def build_command(config)
        options = 'java'
        options << ' -Djava.awt.headless=true'
        options << ' -jar '
        options << Util.vendor_path('plantuml.1.2020.1.jar')
        options << ' -tsvg -pipe'
      end
    end
  end
end

Liquid::Template.register_tag(:plantuml, Jekyll::Diagrams::PlantUMLBlock)