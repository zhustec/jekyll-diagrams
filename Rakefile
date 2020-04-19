# frozen_string_literal: true

require 'bundler/gem_helper'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

def docker
  `uname -r`.include?('Microsoft') ? 'docker.exe' : 'docker'
end

task default: %i[spec]

Cucumber::Rake::Task.new(:features)
RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:rubocop)

namespace :gem do
  Bundler::GemHelper.install_tasks
end

namespace :docker do
  desc 'Build docker image'
  task :build do
    system "#{docker} build . -t diagrams"
  end

  desc 'Run docker image'
  task :run do
    system <<~CMD
      #{docker} run -it --rm --volume #{Dir.pwd}:/home/diagrams/work  diagrams
    CMD
  end
end
