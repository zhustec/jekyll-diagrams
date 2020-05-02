require 'simplecov-lcov'

include SimpleCov::Formatter

LcovFormatter.config do |c|
  c.report_with_single_file = true
  c.output_directory = 'coverage'
  c.lcov_file_name = 'lcov.info'
end

SimpleCov.start do
  enable_coverage :branch

  add_filter %r{^/features}

  formatter MultiFormatter.new([HTMLFormatter, LcovFormatter])
end
