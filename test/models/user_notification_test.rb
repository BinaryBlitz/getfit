# == Schema Information
#
# Table name: user_notifications
#
#  id              :integer          not null, primary key
#  subscription_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserNotificationTest < ActiveSupport::TestCase
  setup do
    @user_notification = user_notifications(:user_notification)
  end

  test 'valid' do
    assert @user_notification.valid?
  end
end
