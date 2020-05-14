# frozen_string_literal: true

require 'bundler/setup'

require 'simplecov'
require 'pry-byebug'

require 'jekyll-diagrams'

RSpec.configure do |config|
  config.formatter = ENV['CI'] ? 'progress' : 'documentation'

  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
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
