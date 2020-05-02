# frozen_string_literal: true

Given('I have a file named {string} with:') do |file, content|
  File.write(file, content)
end

When('I run jekyll build') do
  run_jekyll
end

Then('the file {string} should exist') do |file|
  expect(File.exist?(file)).to be true
end

Then('I should see svg output in {string}') do |file|
  expect(File.read(file)).to match %r{<svg(.|\r|\n)*?>(.|\r|\n)*</svg>}
end

Then('I should see {string} in {string}') do |pattern, file|
  expect(File.read(file)).to match Regexp.new(pattern)
end

Then('I should not see {string} in {string}') do |pattern, file|
  expect(File.read(file)).not_to match Regexp.new(pattern)
end
