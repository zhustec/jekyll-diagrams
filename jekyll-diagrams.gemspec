# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

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

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'jekyll', '>= 3.8', '< 5.0'

  spec.add_development_dependency 'bundler', '>= 1.15.0', '< 3.0'
  spec.add_development_dependency 'coveralls', '>= 0.8', '< 1.0'
  spec.add_development_dependency 'cucumber', '>= 3.0', '< 4.0'
  spec.add_development_dependency 'minitest', '>= 5.10', '< 6.0'
  spec.add_development_dependency 'pry', '>= 0.10', '< 1.0'
  spec.add_development_dependency 'rake', '>= 12.0', '< 14.0'
  spec.add_development_dependency 'rubocop', '>= 0.70', '< 1.0'
end
