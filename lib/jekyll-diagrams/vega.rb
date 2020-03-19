# frozen_string_literal: true

module Jekyll
  module Diagrams
    class VegaBlock < Block
      CONFIGURATIONS = %w[scale].freeze

      def render_svg(code, config)
        code = render_with_stdin_stdout('vl2vg', code) if block_name == 'vegalite'

        command = build_command(config)

        render_with_stdin_stdout(command, code)
      end

      def build_command(config)
        command = +'vg2svg'

        CONFIGURATIONS.each do |conf|
          command << " --#{conf} #{config[conf]}" if config.key?(conf)
        end

        command
      end
    end
  end
end

%i[vega vegalite].each do |tag|
  Liquid::Template.register_tag(tag, Jekyll::Diagrams::VegaBlock)
end
