# frozen_string_literal: true

module Jekyll
  module Diagrams
    class BasicBlock < Liquid::Block
      def self.renderer
        @renderer ||= const_get(renderer_name)
      rescue NameError => error
        raise Errors::RendererNotFoundError, error.message.split(' ').last
      end

      def self.renderer_name
        @renderer_name ||= name.sub(/Block$/, 'Renderer')
      end

      def initialize(tag_name, markup, _tokens)
        super

        @markup = markup.strip
      end

      def render(context)
        if "#{@markup} " =~ Utils::INLINE_OPTIONS_SYNTAX
          inline_options = Utils.parse_inline_options(@markup)
        else
          raise Errors::InlineOptionsSyntaxError, @markup
        end

        self.class.renderer.render(
          context, super.to_s, {
            diagram_name: block_name,
            inline_options: inline_options
          }
        )
      rescue Errors::BasicError => error
        Utils.handle_error(context, error)
      end
    end
  end
end
