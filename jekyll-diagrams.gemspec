$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'jekyll/diagrams/version'

Gem::Specification.new do |spec|
  spec.required_ruby_version = ">= 2.3.7"

  spec.name          = "jekyll-diagrams"
  spec.version       = Jekyll::Diagrams::VERSION
  spec.authors       = ["zhustec"]
  spec.email         = "zhustec@foxmail.com"

  spec.summary       = "Jekyll plugins for diagrams support"
  spec.description   = "Jekyll plugins for diagrams support, including Graphviz, Blockdiag, Seqdiag and so on."
  spec.homepage      = "https://github.com/zhustec/jekyll-diagrams"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", "~> 3.6"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 12.1"
  spec.add_development_dependency "minitest", "~> 5.1"
end
