# == Schema Information
#
# Table name: notifications
#
#  id         :integer          not null, primary key
#  content    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

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
