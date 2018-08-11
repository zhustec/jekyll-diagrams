require 'open3'
require 'tempfile'

module Jekyll
  module Diagrams
    class BlockdiagBlock < Liquid::Block
      def initialize(tag_name, text, tokens)
        super
        @tag_name = tag_name
      end

      def render(context)
        config = context.registers[:site].config["diagrams"]

        @renderer = DiagRenderer.new(config['blockdiag'])

        render_diagram(super)
      end

      private

      def render_diagram(code)
        @renderer.render(code, @tag_name)
      end
    end

    class DiagRenderer
      DEFAULTS = {
        'options' => '-Tsvg --nodoctype'
      }

      def initialize(config)
        @config = DEFAULTS.merge(config)
      end

      def render(code, engine)
        tmp = Tempfile.new(engine).path
        dest = "#{tmp}.svg"

        File.write(tmp, code)
        cmd = "#{engine} #{@config['options']} #{tmp} -o #{dest}"
        ret, status = Open3.capture2(cmd, binmode: true)

        if !status.success?
          raise "Non-zero exit status '#{cmd}': #{status}"
        end

        svg = File.read(dest).force_encoding 'UTF-8'

        wrap_div(svg, engine)
      end

      private

      def wrap_div(svg, engine)
        "<div class='diag #{engine}'>#{svg}</div>"
      end
    end
  end
end


%w(blockdiag seqdiag actdiag nwdiag rackdiag packetdiag).each do |tag|
  Liquid::Template.register_tag tag, Jekyll::Diagrams::BlockdiagBlock
end
