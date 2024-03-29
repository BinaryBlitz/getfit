ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'

ActiveRecord::Migration.maintain_test_schema!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def api_token
    users(:foo).api_token
  end

  def json_response
    JSON.parse(@response.body, symbolize_names: true)
  end
end

class ActionDispatch::IntegrationTest
  def sign_in_user(user, password: 'password')
    post user_session_path, params: { user: { email: user.email, password: password } }
  end

  def sign_in_trainer(trainer, password: 'password')
    post trainer_session_path, params: { trainer: { email: trainer.email, password: password } }
  end

  def sign_in_admin(password: 'password')
    admin = admins(:admin)
    post admin_session_path, params: { admin: { email: admin.email, password: password } }
  end
end
