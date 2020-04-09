# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Don't use coveralls in Github Actions
unless ENV['GITHUB_ACTIONS']
  require 'coveralls'
  Coveralls.wear!
end

require 'minitest/autorun'

require 'fileutils'
require 'jekyll-diagrams'

# Mocking this method for testing
class Jekyll::Diagrams::Block
  def render_with_command(command, _output = :stdout, **_options)
    command
  end
end
