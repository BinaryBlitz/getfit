# == Schema Information
#
# Table name: exercise_types
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  video_url   :string
#  description :text             not null
#  trainer_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ExerciseType < ApplicationRecord
  belongs_to :trainer

  has_many :exercises, dependent: :destroy

  validates :description, presence: true
end
