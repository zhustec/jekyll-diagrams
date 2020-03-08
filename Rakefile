require 'bundler/gem_tasks'
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test

desc 'Run dummy site'
task :dummy_site do
  dummy_site_path = File.expand_path('test/dummy_site', __dir__)

  Dir.chdir(dummy_site_path) do
    puts "Current directory: #{Dir.pwd}"

    %x(bundle install && bundle exec jekyll build)
  end
end
