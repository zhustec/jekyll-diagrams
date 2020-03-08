module Jekyll
  module Diagrams
    class ErdBlock < Block
      CONFIGURATIONS = %w( config edge ).freeze

      def render_svg(code, config)
        command = build_command(config)

        svg = render_with_stdin_stdout(command, code)
        svg.sub!(/^<\?xml(([^>]|\n)*>\n?){2}/, '')
      end

      def build_command(config)
        command = 'erd --fmt=svg'
        command << ' --dot-entity' if config.has_key?('dot-entity')

        CONFIGURATIONS.each do |conf|
          command << " --#{conf}=#{config[conf]}" if config.has_key?(conf)
        end

        command
      end
    end
  end
end

Liquid::Template.register_tag(:erd, Jekyll::Diagrams::ErdBlock)