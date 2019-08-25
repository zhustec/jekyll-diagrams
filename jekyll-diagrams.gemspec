lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'jekyll-diagrams/version'

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-diagrams'
  spec.summary       = 'Jekyll plugins for diagrams support'
  spec.version       = Jekyll::Diagrams::VERSION
  spec.authors       = ['zhustec']
  spec.email         = ['zhustec@foxmail.com']
  spec.homepage      = 'https://github.com/zhustec/jekyll-diagrams'
  spec.license       = 'MIT'
  spec.description   = 'Jekyll plugins for diagrams support, including Graphviz, Blockdiag, Seqdiag and so on.'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r!^(test|spec|features)!)

  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3.0'

  spec.add_dependency 'jekyll', '>= 3.7', '< 5.0'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
