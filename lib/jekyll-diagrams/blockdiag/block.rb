# frozen_string_literal: true

module Jekyll
  module Diagrams
    module Blockdiag
      class Block < Liquid::Block
        def render(context)
          Renderer.render(context, super.to_s, block_name)
        end
      end
    end
  end
end
