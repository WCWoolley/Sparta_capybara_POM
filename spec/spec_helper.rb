require 'capybara'
require 'rspec'
require_relative '../lib/BBC_Site.rb'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.configure do |config|
  config.ignore_hidden_elements = false # make sure that all hidden elements on a page are available
  config.default_max_wait_time = 10 # wait time for asynchronous prcoess to finish
  config.default_driver = :chrome # ensures the default driver is chrome
end
