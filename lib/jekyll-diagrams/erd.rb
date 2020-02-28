module Jekyll
    module Diagrams
      class ErdBlock < Block
        def render_svg(code, config)
          render_with_stdin_stdout(build_command(config), code)
        end
  
        def build_command(config)
          command = 'erd --fmt=svg'

          %w(config edge).each do |conf|
            command << " --#{conf}=#{config[conf]}" if config.has_key?(conf)
          end

          command
        end
      end
    end
  end
  
  Liquid::Template.register_tag(:erb, Jekyll::Diagrams::ErdBlock)