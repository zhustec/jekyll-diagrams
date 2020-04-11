# frozen_string_literal: true

module Jekyll
  module Diagrams
    class WavedromRenderer < BasicRenderer
      def render_svg(code, config)
        command = build_command(config)

        render_with_tempfile(command, code) do |input, output|
          "--input #{input} --svg #{output}"
        end
      end

      def build_command(_config)
        'wavedrom-cli'
      end
    end
  end
end
