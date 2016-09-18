# == Schema Information
#
# Table name: messages
#
#  id               :integer          not null, primary key
#  content          :text             not null
#  category         :string           not null
#  image            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  messageable_type :string
#  messageable_id   :integer
#

class Message < ApplicationRecord
  after_create :notify, if: :trainer?

  belongs_to :messageable, polymorphic: true

  validates :content, presence: true, unless: 'image?'
  validates :category, inclusion: { in: %w(user trainer admin) }

  mount_uploader :image, ImageUploader

  delegate :user, :trainer, to: :messageable

  private

  def notify
    Notifier.new(messageable.user, preview) if messageable_type == 'Subscription'
  end

  def trainer?
    category == 'trainer'
  end

  def preview
    message = image? ? 'Image' : content.truncate(50)
    "#{trainer.full_name}: #{message}"
  end
end
