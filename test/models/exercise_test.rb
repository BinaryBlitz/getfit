# == Schema Information
#
# Table name: exercises
#
#  id               :integer          not null, primary key
#  program_id       :integer
#  exercise_type_id :integer
#  sets             :integer
#  reps             :integer
#  weight           :integer
#  distance         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  setup do
    @exercise = exercises(:exercise)
  end

  test 'valid' do
    assert @exercise.valid?
  end

  test 'positive sets, reps, weight, distance' do
    fields = %w(sets reps weight distance)
    fields.each do |field|
      @exercise.reload

      @exercise.update(field => 0)
      assert @exercise.invalid?

      @exercise.update(field => nil)
      assert @exercise.valid?
    end
  end
end
