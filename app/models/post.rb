# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  image      :string           not null
#  trainer_id :integer
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :trainer
  belongs_to :program

  validates :content, presence: true

  mount_base64_uploader :image, ImageUploader
end
