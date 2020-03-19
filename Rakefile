# frozen_string_literal: true

require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'Run test and show coverage'
task :coverage do
  system 'bundle exec coveralls report'
end

desc 'Run features tests'
task :features do
  system 'bundle exec cucumber --format summary'
end

desc 'Run rubocop'
task :rubocop do
  system 'bundle exec rubocop'
end

task default: %i[test features]
