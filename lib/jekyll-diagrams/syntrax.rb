module Jekyll
  module Diagrams
    class SyntraxBlock < Block
      CONFIGURATIONS = %w( scale style ).freeze

      def render_svg(code, config)
        command = build_command(config)

        render_with_tempfile(command, code) do |command, input, output|
          "#{command} --input #{input} --output #{output}"
        end
      end

      def build_command(config)
        command = 'syntrax'

        CONFIGURATIONS.each do |conf|
          command << " --#{conf} #{config[conf]}" if config.has_key?(conf)
        end

        command
      end
    end
  end
end

Liquid::Template.register_tag(:syntrax, Jekyll::Diagrams::SyntraxBlock)