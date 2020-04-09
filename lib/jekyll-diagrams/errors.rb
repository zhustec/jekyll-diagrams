# frozen_string_literal: true

module Jekyll
  module Diagrams
    module Errors
      BaseError = Class.new(::StandardError) do
        def initialize(msg)
          @msg = msg
        end
      end

      CommandNotFoundError = Class.new(BaseError) do
        def message
          "Command Not Found: #{@msg}"
        end
      end

      RenderingFailedError = Class.new(BaseError) do
        def message
          "Rendering Failed: #{@msg}"
        end
      end
    end
  end
end
