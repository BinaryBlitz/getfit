# == Schema Information
#
# Table name: workout_sessions
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  workout_id    :integer
#  scheduled_for :date
#  completed     :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class WorkoutSession < ApplicationRecord
  after_create :create_exercise_sessions

  belongs_to :user
  belongs_to :workout

  has_many :exercise_sessions, dependent: :destroy

  scope :completed, -> { where(completed: true) }

  private

  def create_exercise_sessions
    workout.exercises.each do |exercise|
      attributes = exercise.to_hash.merge(exercise: exercise)
      exercise_sessions.create(attributes)
    end
  end
end
