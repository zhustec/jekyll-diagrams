# frozen_string_literal: true

module Jekyll
  module Diagrams
    class MermaidBlock < Block
      CONFIGURATIONS = %w[theme width height backgroundColor
                          configFile cssFile scale].freeze

      def render_svg(code, config)
        command = build_command(config)

        render_with_tempfile(command, code) do |input, output|
          "--input #{input} --output #{output}"
        end
      end

      def build_command(config)
        command = +'mmdc --puppeteerConfigFile '
        command << Diagrams.vendor_path('mermaid_puppeteer_config.json')

        CONFIGURATIONS.each do |conf|
          command << " --#{conf} #{config[conf]}" if config.key?(conf)
        end

        command
      end
    end
  end
end

Liquid::Template.register_tag(:mermaid, Jekyll::Diagrams::MermaidBlock)
