# frozen_string_literal: true

require 'bundler/gem_helper'
require 'rake/testtask'
require 'rubocop/rake_task'

namespace :docker do
  desc 'Build docker image'
  task :build do
    system 'docker build docker/ -t diagrams'
  end

  desc 'Run docker image'
  task :run do
    system <<~CMD
      docker run -it --rm --volume #{Dir.pwd}:/home/diagrams/work diagrams
    CMD
  end
end

namespace :gem do
  Bundler::GemHelper.install_tasks
end

RuboCop::RakeTask.new(:rubocop)

desc 'Run tests and show coverage'
task :coverage do
  system 'bundle exec coveralls report'
end

namespace :test do
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
