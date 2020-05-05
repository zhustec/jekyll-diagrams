# frozen_string_literal: true

require_relative 'lib/jekyll_diagrams/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-diagrams'
  spec.version       = JekyllDiagrams::VERSION
  spec.authors       = ['zhustec']
  spec.email         = ['zhustec@foxmail.com']

  spec.summary       = 'Jekyll plugins for diagrams support.'
  spec.description   = <<~DESC
    A Jekyll plugin with support for Blockdiag, Erd, GraphViz, Mermaid,
    Nomnoml, PlantUML, Svgbob, Syntrax, Vega, Vega-Lite and WaveDrom.
  DESC
  spec.homepage      = 'https://github.com/zhustec/jekyll-diagrams'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*', 'LICENSE', 'README.md']
  spec.test_files    = Dir['features/**/*', 'spec/**/*']
  spec.require_path  = 'lib'

  spec.metadata      = {
    'source_code_uri' => 'https://github.com/zhustec/jekyll-diagrams',
    'bug_tracker_uri' => 'https://github.com/zhustec/jekyll-diagrams',
    'changelog_uri' => 'https://github.com/zhustec/jekyll-diagrams/releases',
    'homepage_uri' => spec.homepage
  }

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'jekyll', '>= 3.8', '< 5.0'
  spec.add_dependency 'liquid-diagrams', '~> 0.3'

  spec.add_development_dependency 'cucumber', '>= 3.0'
  spec.add_development_dependency 'pry-byebug', '~> 3.0'
  spec.add_development_dependency 'rake', '>= 12.0', '< 14.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.82.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.30'
  spec.add_development_dependency 'simplecov', '~> 0.16'
  spec.add_development_dependency 'simplecov-lcov', '~> 0.5'
end
