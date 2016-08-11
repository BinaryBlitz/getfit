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
#  duration           :integer
#

require 'test_helper'

class ExerciseSessionTest < ActiveSupport::TestCase
  setup do
    @exercise_session = exercise_sessions(:exercise_session)
  end

  test 'valid' do
    assert @exercise_session.valid?
  end

  test 'positive sets, reps, weight, distance' do
    fields = %i(sets reps weight distance)
    fields.each do |field|
      @exercise_session.exercise.reload

      @exercise_session.exercise.update(field => 0)
      assert @exercise_session.exercise.invalid?

      @exercise_session.exercise.update(field => nil)
      assert @exercise_session.exercise.valid?
    end
  end

  test 'validates presence of attribute in exercise' do
    %i(sets reps weight distance).each do |attribute|
      @exercise_session.exercise.reload

      @exercise_session.exercise[attribute] = nil
      @exercise_session[attribute] = 1

      assert @exercise_session.invalid?
    end
  end
end
