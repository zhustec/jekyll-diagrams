# frozen_string_literal: true

module Jekyll
  module Diagrams
    class SvgbobRenderer < BasicRenderer
      CONFIGURATIONS = %w[font-family font-size scale stroke-width].freeze

      def render_svg(code, config)
        command = build_command(config)

        render_with_stdin_stdout(command, code)
      end

      def build_command(config)
        command = +'svgbob'

        CONFIGURATIONS.each do |conf|
          command << " --#{conf} #{config[conf]}" if config.key?(conf)
        end

        command
      end
    end
  end
end
