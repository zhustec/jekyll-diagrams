module Jekyll
    module Diagrams
      class MermaidBlock < Block
        CONFIGURATIONS = {
          'theme' => 'default',
          'width' => 800,
          'height' => 600,
          'backgroundColor' => 'white'
        }.freeze

        def render_svg(code, config)
          render_with_tempfile(build_command(config), code) do |command, input, output|
            "#{command} --input #{input} --output #{output}"
          end
        end
  
        def build_command(config)
          command = 'mmdc'
          command << ' --transparent' if config.has_key?('transparent')
          command << " --puppeteerConfigFile #{Util.vendor_path('mermaid_puppeteer_config.json')}"

          CONFIGURATIONS.merge(config).each do |conf, value|
            command << " --#{conf} #{value}"
          end

          command
        end
      end
    end
  end
  
  Liquid::Template.register_tag(:mermaid, Jekyll::Diagrams::MermaidBlock)