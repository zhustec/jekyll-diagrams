# frozen_string_literal: true

require 'rspec'
require 'simplecov'

require 'jekyll-diagrams'

RSpec.configure do |config|
  config.order = :random
  config.example_status_persistence_file_path = 'tmp/rspec_examples.txt'
end

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

  Liquid::Context.new(
    {}, {}, {
      page: {},
      site: Jekyll::Site.new(Jekyll.configuration(config))
    }
  )
end
