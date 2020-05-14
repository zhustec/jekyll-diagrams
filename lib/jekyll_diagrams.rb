# frozen_string_literal: true

require 'jekyll'
require 'liquid-diagrams'

require_relative 'jekyll_diagrams/version'

LiquidDiagrams.register_diagrams(LiquidDiagrams.diagrams)

module LiquidDiagrams
  class BasicBlock
    alias origin_render render
    alias origin_read_config read_config

    def render(context)
      JekyllDiagrams.wrap_class(origin_render(context), block_name)
    end

    def read_config
      jekyll_config = JekyllDiagrams.configuration(@context, block_name) || {}

      jekyll_config.merge(origin_read_config)
    end

    def handle_error(error)
      JekyllDiagrams.handle_error(@context, error)
    end
  end
end

module JekyllDiagrams
  class << self
    def config_name
      'jekyll-diagrams'
    end

    def logger_topic
      'Jekyll Diagrams:'
    end

    def jekyll_configuration(context)
      site_config = context.registers[:site].config
      page_config = context.registers[:page]

      site_config.merge(page_config)
    end

    def configuration(context, key = nil)
      config = jekyll_configuration(context).fetch(config_name, {})

      config.dup.delete(key) if key
    end

    def error_mode(context)
      liquid_mode = jekyll_configuration(context).dig('liquid', 'error_mode')
      custom_mode = configuration(context, 'error_mode')

      (custom_mode || liquid_mode || :warn).to_sym
    end

    def handle_error(context, error)
      mode = error_mode(context)

      case mode
      when :lax
        ''
      when :warn
        Jekyll.logger.warn logger_topic, error
        error
      when :strict
        Jekyll.logger.abort_with logger_topic, error
      else
        raise StandardError
      end
    end

    def wrap_class(content, class_names)
      <<~CONTENT
        <div class='#{config_name} diagrams #{class_names}'>
          #{content}
        </div>
      CONTENT
    end
  end
end
