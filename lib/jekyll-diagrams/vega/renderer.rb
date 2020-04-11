# frozen_string_literal: true

module Jekyll
  module Diagrams
    module Vega
      class Renderer < BaseRenderer
        CONFIGURATIONS = %w[scale].freeze

        def render_svg(code, config)
          if @block_name == 'vegalite'
            code = render_with_stdin_stdout('vl2vg', code)
          end

          command = build_command(config)

          render_with_stdin_stdout(command, code)
        end

        def build_command(config)
          command = +'vg2svg'

          CONFIGURATIONS.each do |conf|
            command << " --#{conf} #{config[conf]}" if config.key?(conf)
          end

          command
        end
      end
    end
  end
end
