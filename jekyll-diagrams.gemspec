# frozen_string_literal: true

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'jekyll-diagrams/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-diagrams'
  spec.version       = Jekyll::Diagrams::VERSION
  spec.author        = 'zhustec'
  spec.email         = 'zhustec@foxmail.com'
  spec.homepage      = 'https://github.com/zhustec/jekyll-diagrams'
  spec.license       = 'MIT'
  spec.summary       = 'Jekyll plugins for diagrams support.'
  spec.description   = <<~DESC
    A Jekyll plugin with support for Blockdiag, Erd, GraphViz, Mermaid,
    Nomnoml, PlantUML, Svgbob, Syntrax, Vega, Vega-Lite and WaveDrom.
  DESC

  spec.files         = Dir['lib/**/*', 'vendor/**/*', 'LICENSE', 'README.md']
  spec.test_files    = Dir['features/**/*', 'spec/**/*', 'test/**/*']
  spec.require_path  = 'lib'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.5')

  spec.add_dependency 'jekyll', '>= 3.8', '< 5.0'

  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-lcov'
end
