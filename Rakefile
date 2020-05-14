# frozen_string_literal: true

require 'bundler/gem_helper'

require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

# Docker Desktop for Windows in WSL
docker = `which docker`.empty? ? 'docker.exe' : 'docker'
docker_image = 'zhustec/jekyll-diagrams'

task default: %i[spec]

Cucumber::Rake::Task.new(:features)

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new(:rubocop)

namespace :gem do
  Bundler::GemHelper.install_tasks
end

namespace :docker do
  desc "Build #{docker_image}"
  task :build do
    system "#{docker} build . -t #{docker_image}"
  end

  desc "Run shell in #{docker_image}"
  task :shell do
    system <<~CMD
      #{docker} run -it --rm -v #{Dir.pwd}:/work #{docker_image} /bin/bash
    CMD
  end

  desc "Run Cucumber features in #{docker_image}"
  task :features do
    system <<~CMD
      #{docker} run -it --rm -v #{Dir.pwd}:/work #{docker_image} \
          /bin/bash -c 'bundle exec rake features'
    CMD
  end
end
