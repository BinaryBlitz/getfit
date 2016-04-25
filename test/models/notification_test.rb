require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  setup do
    @notification = notifications(:notification)
  end

  test 'valid' do
    assert @notification.valid?
  end

  test 'invalid without content' do
    @notification.content = ''
    assert @notification.invalid?

    @notification.content = nil
    assert @notification.invalid?
  end
end
