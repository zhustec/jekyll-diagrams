module Jekyll
    module Diagrams
      class MermaidBlock < Block
        CONFIGURATIONS = %w( backgroundColor height theme width).freeze

        def render_svg(code, config)
          command = build_command(config)

          render_with_tempfile(command, code) do |command, input, output|
            "#{command} --input #{input} --output #{output}"
          end
        end

        def build_command(config)
          command = 'mmdc'
          command << ' --transparent' if config.has_key?('transparent')
          command << " --puppeteerConfigFile #{vendor_path('mermaid_puppeteer_config.json')}"

          CONFIGURATIONS.each do |conf|
            command << " --#{conf} #{config[conf]}" if config.has_key?(conf)
          end

          command
        end
      end
    end
  end

  Liquid::Template.register_tag(:mermaid, Jekyll::Diagrams::MermaidBlock)