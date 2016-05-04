# == Schema Information
#
# Table name: user_notifications
#
#  id              :integer          not null, primary key
#  subscription_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class UserNotification < ApplicationRecord
  after_create :notify

  belongs_to :subscription

  delegate :user, to: :subscription

  private

  def notify
    Notifier.new(user, 'Изменение в персональной тренировке.', subscription: subscription)
  end
end
