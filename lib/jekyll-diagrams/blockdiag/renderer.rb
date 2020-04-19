# frozen_string_literal: true

module Jekyll
  module Diagrams
    %i[blockdiag seqdiag actdiag nwdiag rackdiag packetdiag].each do |name|
      renderer = Class.new(BasicRenderer) do
        const_set :CONFIGURATIONS, %w[config font fontmap size].freeze
        const_set :SWITCHES, {
          'antialias' => false
        }.freeze

        def render_svg(code, config)
          command = build_command(config)

          render_with_tempfile(command, code) do |input, output|
            "#{input} -o #{output}"
          end
        end

        def build_command(config)
          command = +"#{@diagram} -T svg --nodoctype"

          switches = self.class.const_get(:SWITCHES)

          switches.merge(config.slice(*switches.keys)).each do |switch, value|
            command << " --#{switch}" if value != false
          end

          self.class.const_get(:CONFIGURATIONS).each do |conf|
            command << " --#{conf}=#{config[conf]}" if config.key?(conf)
          end

          command
        end
      end

      const_set "#{name.capitalize}Renderer", renderer
    end
  end
end
