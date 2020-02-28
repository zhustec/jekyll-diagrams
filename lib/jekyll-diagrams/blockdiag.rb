require 'open3'
require 'tempfile'

module Jekyll
  module Diagrams
    class BlockdiagBlock < Block
      def render_svg(code, config)
        command = build_command(config)
        
        render_with_tempfile(command, code, :svg) do |command, input, output|
          "#{command} #{input} -o #{output}"
        end
      end

      def read_config(context)
        Util.config_for(context, 'blockdiag').merge(Util.config_for(context, block_name))
      end

      def build_command(config)
        command = "#{block_name} -Tsvg --nodoctype"

        antialias = config.fetch('antialias', false)

        if antialias && antialias != 'false'
          command << ' --antialias'
        end

        %w(config font fontmap size).each do |key|
          value = config.fetch(key, nil)
          command << " --#{key}=#{value}" if value
        end

        command
      end
    end
  end
end

%i(blockdiag seqdiag actdiag nwdiag rackdiag packetdiag).each do |tag|
  Liquid::Template.register_tag(tag, Jekyll::Diagrams::BlockdiagBlock)
end