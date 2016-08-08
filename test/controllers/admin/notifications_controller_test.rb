require 'test_helper'

class Admin::NotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notification = notifications(:notification)
    sign_in_admin
  end

  test 'should get index' do
    get admin_notifications_url
    assert_response :success
  end

  test 'should get new' do
    get new_admin_notification_url
    assert_response :success
  end

  test 'should create notification' do
    assert_difference('Notification.count') do
      post admin_notifications_url, params: {
        notification: { content: @notification.content }
      }
    end

    assert_redirected_to admin_notifications_url
  end
end
