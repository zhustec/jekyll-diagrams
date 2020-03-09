module Jekyll
  module Diagrams
    class SMCatBlock < Block
      CONFIGURATIONS = %w( direction engine input-type ).freeze

      def render_svg(code, config)
        command = build_command(config)

        svg = render_with_tempfile(command, code, stdout: true) do |command, input|
          "#{command} #{input} -"
        end

        svg.sub!(/^<\?xml(([^>]|\n)*>\n?){2}/, '')
      end

      def build_command(config)
        command = 'smcat'

        CONFIGURATIONS.each do |conf|
          command << " --#{conf} #{config[conf]}" if config.has_key?(conf)
        end

        command
      end
    end
  end
end

Liquid::Template.register_tag(:smcat, Jekyll::Diagrams::SMCatBlock)