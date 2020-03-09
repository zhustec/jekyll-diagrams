
lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'coveralls'

Coveralls.wear!

require 'fileutils'
require 'jekyll'

require 'jekyll-diagrams/util'
require 'jekyll-diagrams/renderer'
require 'jekyll-diagrams/block'

require 'minitest/autorun'