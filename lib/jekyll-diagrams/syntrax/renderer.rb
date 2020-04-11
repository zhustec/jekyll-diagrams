# frozen_string_literal: true

module Jekyll
  module Diagrams
    module Syntrax
      class Renderer < BaseRenderer
        CONFIGURATIONS = %w[scale style].freeze

        def render_svg(code, config)
          command = build_command(config)

          render_with_tempfile(command, code) do |input, output|
            "--input #{input} --output #{output}"
          end
        end

        def build_command(config)
          command = +'syntrax'

          CONFIGURATIONS.each do |conf|
            command << " --#{conf} #{config[conf]}" if config.key?(conf)
          end

          command
        end
      end
    end
  end
end
