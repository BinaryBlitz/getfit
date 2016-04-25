require 'test_helper'

class UserNotificationTest < ActiveSupport::TestCase
  setup do
    @user_notification = user_notifications(:user_notification)
  end

  test 'valid' do
    assert @user_notification.valid?
  end
end
