# frozen_string_literal: true

require 'bundler/gem_helper'
require 'rake/testtask'

namespace :docker do
  desc 'Build docker image'
  task :build do
    system 'docker build docker/ -t diagrams'
  end

  desc 'Run docker image'
  task :run do
    system <<~CMD
      docker run -it --rm \
          --mount type=bind,source=#{Dir.pwd},target=/app diagrams
    CMD
  end
end

namespace :gem do
  Bundler::GemHelper.install_tasks
end

desc 'Run rubocop '
task :rubocop do
  system 'bundle exec rubocop'
end

namespace :rubocop do
  desc 'Run rubocop and autofix'
  task :autofix do
    system 'bundle exec rubocop -a'
  end
end

namespace :test do
  desc 'Run tests and show coverage'
  task :coverage do
    system 'bundle exec coveralls report'
  end

  desc 'Run tests for features'
  task :features do
    system 'bundle exec cucumber'
  end

  Rake::TestTask.new(:minitest) do |t|
    t.libs << 'test'
    t.libs << 'lib'
    t.test_files = FileList['test/**/*_test.rb']
  end
end

desc 'Run features and minitest'
task test: %w[test:features test:minitest]

task default: :test
