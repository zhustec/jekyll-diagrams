# frozen_string_literal: true

require 'simplecov'
require 'rspec'
require 'factory_bot'

require 'jekyll-diagrams'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
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
