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

  spec.metadata      = {
    'source_code_uri' => 'https://github.com/zhustec/jekyll-diagrams',
    'bug_tracker_uri' => 'https://github.com/zhustec/jekyll-diagrams',
    'changelog_uri' => 'https://github.com/zhustec/jekyll-diagrams/releases',
    'homepage_uri' => spec.homepage
  }

  spec.post_install_message = "
    __________________________________________________________
    ..........................................................

    Thank you for installing jekyll-diagrams.

    But it doesn't mean that you can use all diagrams for now,
    You still need to install some dependencies by your self.

    Refer to the link below for more details:

    https://github.com/zhustec/jekyll-diagrams#readme

    ..........................................................
    __________________________________________________________
  "

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'jekyll', '>= 3.8', '< 5.0'

  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'simplecov-lcov'
end
