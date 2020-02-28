module Jekyll
    module Diagrams
      class SyntraxBlock < Block
        def render_svg(code, config)
          render_with_tempfile(build_command(config), code) do |command, input, output|
            "#{command} --input #{input} --output #{output}"
          end
        end
  
        def build_command(config)
          command = 'syntrax'

          %w(scale style).each do |conf|
            command << " --#{conf} #{config[conf]}" if config.has_key?(conf)
          end

          command
        end
      end
    end
  end
  
  Liquid::Template.register_tag(:syntrax, Jekyll::Diagrams::SyntraxBlock)