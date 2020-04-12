# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'simplecov'
require 'rspec'
require 'fileutils'
require 'jekyll-diagrams'

# Mocking this method for testing
class Jekyll::Diagrams::Renderer
  def render_with_command(command, _output = :stdout, **_options)
    command
  end
end

def context_with_config(config = {})
  config = {
    quiet: true
  }.merge(config)

  context = Liquid::Template.new
  context.registers[:page] = {}
  context.registers[:site] = Jekyll::Site.new(
    Jekyll.configuration(config)
  )

  context
end
