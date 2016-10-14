# == Schema Information
#
# Table name: tickets
#
#  id              :integer          not null, primary key
#  content         :text             not null
#  category        :string           not null
#  image           :string
#  conversation_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Ticket < ApplicationRecord
  belongs_to :conversation

  validates :content, presence: true, unless: 'image?'
  validates :category, inclusion: { in: %w(trainer admin) }

  mount_uploader :image, ImageUploader
end
