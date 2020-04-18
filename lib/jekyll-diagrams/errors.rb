# frozen_string_literal: true

module Jekyll
  module Diagrams
    module Errors
      class BasicError < ::StandardError
        def initialize(val)
          # Jekyll::...::CommandNotFoundError -> 'CommandNotFoundError'
          klass = self.class.name.split('::').last
          # 'CommandNotFound' -> 'Command Not Found'
          prefix = klass.sub(/Error$/, '').split(/(?=[A-Z])/).join(' ')

          # "Command Not Found: raw message"
          super("#{prefix}: #{val}")
        end
      end

      CommandNotFoundError = Class.new(BasicError)
      RenderingFailedError = Class.new(BasicError)
      RendererNotFoundError = Class.new(BasicError)
      UnkownErrorModeError = Class.new(BasicError)
    end
  end
end
