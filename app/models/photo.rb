# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image      :string           not null
#  trainer_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ApplicationRecord
  belongs_to :trainer

  validates :image, presence: true

  mount_base64_uploader :image, ImageUploader
end
