ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new(
  provider: "auth0",
  uid: "google-oauth2|this-is-the-google-id",
  info: {name: "John Doe"}
)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
