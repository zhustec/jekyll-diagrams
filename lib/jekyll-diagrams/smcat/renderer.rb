# frozen_string_literal: true

module Jekyll
  module Diagrams
    class SMCatRenderer < BasicRenderer
      XML_REGEX = /^<\?xml(([^>]|\n)*>\n?){2}/.freeze
      CONFIGURATIONS = %w[direction engine input-type].freeze

      def render_svg(code, config)
        command = build_command(config)

        svg = render_with_tempfile(command, code) do |input, output|
          "#{input} --output-to #{output}"
        end

        svg.sub!(XML_REGEX, '')
      end

      def build_command(config)
        command = +'smcat'

        CONFIGURATIONS.each do |conf|
          command << " --#{conf} #{config[conf]}" if config.key?(conf)
        end

        command
      end
    end
  end
end
