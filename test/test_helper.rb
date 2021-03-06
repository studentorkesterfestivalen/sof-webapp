ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rails'
require 'mocha/mini_test'
require 'helpers/mail_parse_helper'
require 'helpers/email_supported_test'

if ENV['IS_INTEGRATION_TEST'] != 'true'
  abort('Testing with rake test is unsupported. Please use the script test.sh instead.')
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
