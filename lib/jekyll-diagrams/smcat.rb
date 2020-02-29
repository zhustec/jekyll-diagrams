module Jekyll
    module Diagrams
      class SMCatBlock < Block
        CONFIGURATIONS = {
          'input-type' => 'smcat',
          'engine' => 'dot',
          'direction' => 'top-down'
        }.freeze

        def render_svg(code, config)
          svg = render_with_tempfile(build_command(config), code) do |command, input, output|
            "#{command} #{input} --output-to #{output}"
          end

          svg.sub!(/^<\?xml(([^>]|\n)*>\n?){2}/, '')
        end
  
        def build_command(config)
          command = 'smcat'

          CONFIGURATIONS.merge(config).each do |conf, value|
            command << " --#{conf} #{value}"
          end

          command
        end
      end
    end
  end
  
  Liquid::Template.register_tag(:smcat, Jekyll::Diagrams::SMCatBlock)