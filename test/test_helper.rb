require 'jekyll'
require 'fileutils'
require File.expand_path('../lib/jekyll-diagrams', __dir__)

Jekyll.logger.log_level = :error

SOURCE_DIR = File.expand_path("fixtures", __dir__)
DEST_DIR   = File.expand_path("dest", __dir__)

def source_dir(*files)
  File.join(SOURCE_DIR, *files)
end

def dest_dir(*files)
  File.join(DEST_DIR, *files)
end

require 'minitest/autorun'
