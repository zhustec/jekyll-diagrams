# frozen_string_literal: true

module Jekyll
  module Diagrams
    class NomnomlBlock < Block
      def render_svg(code, config)
        command = build_command(config)

        render_with_tempfile(command, code) do |input, output|
          "#{input} #{output}"
        end
      end

      def build_command(_config)
        'nomnoml'
      end
    end
  end
end

Liquid::Template.register_tag(:nomnoml, Jekyll::Diagrams::NomnomlBlock)
