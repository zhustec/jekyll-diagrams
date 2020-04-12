# frozen_string_literal: true

module Jekyll
  module Diagrams
    module BasicFilter
      def self.included(filter_module)
        # Jekyll::...::BasicFilter -> 'Basic'
        name = filter_module.name.split('::').last.sub(/Filter$/, '')
        # 'basic'
        diagram = name.downcase

        filter_module.module_eval do
          class << self
            def renderer
              @renderer ||= Diagrams.const_get(renderer_name)
            rescue NameError => e
              # uninitialized constant SomeConstant
              raise Errors::RendererNotFoundError, e.message.split(' ').last
            end

            def renderer_name
              @renderer_name ||=
                "#{name.split('::').last.sub(/Filter$/, '')}Renderer"
            end

            def diagram_name
              @diagram_name ||=
                name.split('::').last.sub(/Filter$/, '').downcase
            end
          end

          define_method "as_#{diagram}" do |input|
            filter_module.renderer.render(
              @context, input, filter_module.diagram_name
            )
          rescue Errors::RendererNotFoundError => e
            Utils.handle_error(context, e)
          end
        end
      end
    end
  end
end
