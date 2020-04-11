# frozen_string_literal: true

module Jekyll
  module Diagrams
    module Blockdiag
      class Renderer < BaseRenderer
        CONFIGURATIONS = %w[config font fontmap size].freeze
        SWITCHES = {
          'antialias' => false
        }.freeze

        def render_svg(code, config)
          command = build_command(config)

          render_with_tempfile(command, code) do |input, output|
            "#{input} -o #{output}"
          end
        end

        def build_command(config)
          command = +"#{@block_name} -T svg --nodoctype"

          SWITCHES.merge(config.slice(*SWITCHES.keys)).each do |switch, value|
            command << " --#{switch}" if value != false
          end

          CONFIGURATIONS.each do |conf|
            command << " --#{conf}=#{config[conf]}" if config.key?(conf)
          end

          command
        end
      end
    end
  end
end
