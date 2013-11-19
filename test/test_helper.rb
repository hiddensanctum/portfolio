require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "capybara/webkit"
require "database_cleaner"
Capybara.javascript_driver = :webkit
# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

def sign_in(u)
  puts users(u).email
  visit new_user_session_path
  fill_in "Email", with: users(u).email
  fill_in "Password", with: "password"
  click_on "Sign in"
end

DatabaseCleaner.strategy = :truncation

class ActiveSupport::TestCase
  self.use_transactional_fixtures = false
  before :each do
    puts "==================Database Cleaning================"
    DatabaseCleaner.start

  end

  after :each do
    DatabaseCleaner.clean
  end

  include Capybara::DSL
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all
  # Add more helper methods to be used by all tests here...
end
