# frozen_string_literal: true

module Jekyll
  module Diagrams
    class ErdRenderer < BasicRenderer
      XML_REGEX = /^<\?xml(([^>]|\n)*>\n?){2}/.freeze
      CONFIGURATIONS = %w[config edge].freeze
      SWITCHES = {
        'dot-entity' => false
      }.freeze

      def render_svg(code, config)
        command = build_command(config)

        svg = render_with_stdin_stdout(command, code)
        svg.sub!(XML_REGEX, '')
      end

      def build_command(config)
        command = +'erd --fmt=svg'

        SWITCHES.merge(config.slice(*SWITCHES.keys)).each do |switch, value|
          command << " --#{switch}" if value != false
        end

        CONFIGURATIONS.each do |conf|
          command << " --#{conf}=#{config[conf]}" if config.key?(conf)
        end

        command
      end
    end
  end
end
