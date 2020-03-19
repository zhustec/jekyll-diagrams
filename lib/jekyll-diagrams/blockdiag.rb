# frozen_string_literal: true

module Jekyll
  module Diagrams
    class BlockdiagBlock < Block
      CONFIGURATIONS = %w[config font fontmap size].freeze

      def render_svg(code, config)
        command = build_command(config)

        render_with_tempfile(command, code) do |input, output|
          "#{input} -o #{output}"
        end
      end

      def read_config(context)
        config_for(context, 'blockdiag').merge(config_for(context, block_name))
      end

      def build_command(config)
        command = "#{block_name} -T svg --nodoctype"
        command << ' --antialias' if config.fetch('antialias', false) != false

        CONFIGURATIONS.each do |conf|
          command << " --#{conf}=#{config[conf]}" if config.key?(conf)
        end

        command
      end
    end
  end
end

%i[blockdiag seqdiag actdiag nwdiag rackdiag packetdiag].each do |tag|
  Liquid::Template.register_tag(tag, Jekyll::Diagrams::BlockdiagBlock)
end
