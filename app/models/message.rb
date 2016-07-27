# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  content         :text             not null
#  category        :string           not null
#  subscription_id :integer
#  image           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Message < ApplicationRecord
  after_create :notify, if: :trainer?

  belongs_to :subscription

  validates :content, presence: true, unless: 'image?'
  validates :category, inclusion: { in: %w(user trainer) }

  mount_uploader :image, ImageUploader

  delegate :user, :trainer, to: :subscription

  private

  def notify
    Notifier.new(subscription.user, preview)
  end

  def trainer?
    category == 'trainer'
  end

  def preview
    message = image? ? 'Image' : content.truncate(50)
    "#{trainer.full_name}: #{message}"
  end
end
