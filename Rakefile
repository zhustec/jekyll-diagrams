# frozen_string_literal: true

require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

desc 'Run features tests'
task :features do
  system 'bundle exec cucumber'
end

desc 'Run rubocop'
task :rubocop do
  system 'bundle exec rubocop lib'
end

task default: %i[test features]
