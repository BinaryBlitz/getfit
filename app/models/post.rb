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
#  comments_count :integer          default(0)
#

class Post < ApplicationRecord
  belongs_to :trainer
  belongs_to :program, optional: true

  has_many :comments, dependent: :destroy

  validates :content, presence: true

  mount_uploader :image, ImageUploader
end
