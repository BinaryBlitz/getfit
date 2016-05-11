# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  content        :text             not null
#  image          :string
#  trainer_id     :integer
#  program_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  likes_count    :integer          default(0)
#  comments_count :integer          default(0)
#

class Post < ApplicationRecord
  belongs_to :trainer
  belongs_to :program, optional: true

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true

  mount_uploader :image, ImageUploader
end
