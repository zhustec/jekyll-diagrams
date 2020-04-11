# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'simplecov'

require 'minitest/autorun'

require 'fileutils'
require 'jekyll-diagrams'

# Mocking this method for testing
class Jekyll::Diagrams::Renderer
  def render_with_command(command, _output = :stdout, **_options)
    command
  end
end
