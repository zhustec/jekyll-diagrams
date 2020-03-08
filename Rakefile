require 'bundler/gem_tasks'
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task default: :test


namespace :dummy_site do
  DUMMY_SITE_PATH = File.expand_path('test/dummy_site', __dir__)
  DIAGRAMS = %w(blockdiag erd graphviz mermaid nomnoml plantuml smcat wavedrom)

  %w(build serve).each do |action|
    desc "#{action.capitalize} the dummy site"
    task action.to_sym, :diagram do |t, args|
      args.with_defaults(diagram: '')
      diagram = args[:diagram]
      path = File.join(DUMMY_SITE_PATH, diagram)

      Dir.chdir(DUMMY_SITE_PATH) do
        %x(bundle install && bundle exec jekyll #{action} --config _config.yml -s #{path})
      end
    end
  end
end