require 'open3'
require 'tempfile'

module Jekyll
  module Diagrams
    class BlockdiagBlock < Liquid::Block
      DEFAULTS = {
      }
      OPTIONS = '-T svg --nodoctype'

      def initialize(tag_name, text, tokens)
        super
        @tag_name = tag_name
      end

      def render(context)
        code = super.to_s
        config = DEFAULTS.merge(Utils.config_for(context, 'blockdiag'))

        tmpfile = Tempfile.new(@tag_name).path
        output = "#{tmpfile}.svg"

        File.write(tmpfile, code)
        cmd = "#@tag_name #{OPTIONS} #{config['options']} #{tmpfile} -o #{output}"
        _, status = Open3.capture2(cmd, binmode: true)

        if !status.success?
          raise "Non-zero exit status '#{cmd}': #{status}"
        end

        svg = File.read(output)
        wrap(svg.force_encoding('UTF-8'))
      end

      private

      def wrap(svg)
        "<div class='diagrams #@tag_name'>#{svg}</div>"
      end
    end
  end
end

%w(blockdiag seqdiag actdiag nwdiag rackdiag packetdiag).each do |tag|
  Liquid::Template.register_tag(tag, Jekyll::Diagrams::BlockdiagBlock)
end
