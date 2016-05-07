# == Schema Information
#
# Table name: exercise_sessions
#
#  id                 :integer          not null, primary key
#  exercise_id        :integer
#  workout_session_id :integer
#  sets               :integer
#  reps               :integer
#  weight             :integer
#  distance           :integer
#  completed          :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class ExerciseSession < ApplicationRecord
  belongs_to :exercise
  belongs_to :workout_session

  validates :sets, :reps, :weight, :distance, numericality: { greater_than: 0 }, allow_nil: true
  validate :exercise_field_present?

  scope :completed, -> { where(completed: true) }

  private

  def exercise_field_present?
    %i(sets reps weight distance).each do |attribute|
      errors.add(attribute, 'not present in exercise') unless exercise[attribute].present?
    end
  end
end
