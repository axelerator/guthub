require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest


  def login user, password = 'secret'
    if user.is_a? Symbol
      user = users(user)
    end
    post user_sessions_url, params: {email: user.email, password: password}
    user
  end

  def logout
    get logout_path
    assert_redirected_to root_url
  end

  def login_admin
    admin = users(:admin)
    login(admin)
  end

end
