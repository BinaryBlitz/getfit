require 'test_helper'

class API::NotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notification = notifications(:notification)
  end

  test 'should get index' do
    get api_notifications_path(api_token: api_token)
    assert_response :success
  end
end
