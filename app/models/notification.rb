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

class Notification < ApplicationRecord
  after_create :notify

  validates :content, presence: true

  mount_uploader :image, ImageUploader

  private

  def notify
    User.find_each { |user| Notifier.new(user, content) }
  end
end
