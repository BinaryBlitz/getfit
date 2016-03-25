# == Schema Information
#
# Table name: exercises
#
#  id               :integer          not null, primary key
#  exercise_type_id :integer
#  sets             :integer
#  reps             :integer
#  weight           :integer
#  distance         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  workout_id       :integer
#

class Exercise < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise_type

  has_many :exercise_sessions, dependent: :destroy

  validates :sets, :reps, :weight, :distance, numericality: { greater_than: 0 }, allow_nil: true
end
