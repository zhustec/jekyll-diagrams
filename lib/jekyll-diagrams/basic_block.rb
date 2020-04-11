# frozen_string_literal: true

module Jekyll
  module Diagrams
    class BasicBlock < Liquid::Block
      def render(context)
        # BasicBlock -> Basic
        name = self.class.name.sub(/Block$/, '')
        # Basic -> BasicRenderer
        renderer = Diagrams.const_get("#{name}Renderer")

        renderer.render(context, super.to_s, block_name)
      end
    end
  end
end
