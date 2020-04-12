# frozen_string_literal: true

lib = File.expand_path('../lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'simplecov'
require 'rspec'
require 'tmpdir'
require 'jekyll-diagrams'

TEST_DIR = File.join(Dir.tmpdir, 'jekyll-diagrams-features')

Before do
  FileUtils.rm_rf(TEST_DIR) if File.exist?(TEST_DIR)
  FileUtils.mkdir_p(TEST_DIR)
  Dir.chdir(TEST_DIR)
end

After do
  if File.exist?(TEST_DIR)
    Dir.chdir(File.dirname(TEST_DIR))
    FileUtils.rm_rf(TEST_DIR)
  end
end

def run_jekyll
  options = Jekyll.configuration(
    source: TEST_DIR,
    quiet: true
  )

  Jekyll::Site.new(options).process
end
