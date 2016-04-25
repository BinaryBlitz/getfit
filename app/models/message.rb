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
  belongs_to :subscription

  validates :content, presence: true, unless: 'image?'
  validates :category, inclusion: { in: %w(user trainer) }

  mount_uploader :image, ImageUploader
end
