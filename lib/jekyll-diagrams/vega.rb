module Jekyll
  module Diagrams
    class VegaBlock < Block
      CONFIGURATIONS = %w( scale )

      def render_svg(code, config)
        command = build_command(config)

        render_with_stdin_stdout(command, code)
      end

      def build_command(config)
        command = case block_name
        when 'vega'
          'vg2svg'
        when 'vegalite'
          'vl2svg'
        end

        CONFIGURATIONS.each do |conf|
          command << " --#{conf} #{config[conf]}" if config.has_key?(conf)
        end
      end
    end
  end
end

%i(vega vegalite).each do |tag|
  Liquid::Template.register_tag(tag, Jekyll::Diagrams::VegaBlock)
end