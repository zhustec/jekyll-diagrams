# frozen_string_literal: true

Given('I have a file {string} with content:') do |file, content|
  File.write(file, content)
end

When('I run jekyll build') do
  run_jekyll
end

Then('the file {string} should exist') do |file|
  assert File.exist?(file)
end

Then('I should see svg output in {string}') do |file|
  assert_match %r{<svg(.|\r|\n)*?>(.|\r|\n)*</svg>}, File.read(file)
end

Then('I should see {string} in {string}') do |pattern, file|
  assert_match Regexp.new(pattern), File.read(file)
end

Then('I should not see {string} in {string}') do |pattern, file|
  refute_match Regexp.new(pattern), File.read(file)
end
