# == Schema Information
#
# Table name: workouts
#
#  id              :integer          not null, primary key
#  position        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  program_id      :integer
#  duration        :integer
#  exercises_count :integer          default(0)
#

require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  setup do
    @workout = workouts(:workout)
  end

  test 'valid' do
    assert @workout.valid?
  end

  test 'duration is not negative' do
    @workout.duration = -1

    assert @workout.invalid?
  end
end
