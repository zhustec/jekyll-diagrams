module Jekyll
  module Diagrams
    class NomnomlBlock < Block
      def render_svg(code, config)
        command = build_command(config)

        render_with_tempfile(command, code, stdout: true) do |command, input|
          "#{command} #{input}"
        end
      end

      def build_command(config)
        'nomnoml'
      end
    end
  end
end

Liquid::Template.register_tag(:nomnoml, Jekyll::Diagrams::NomnomlBlock)