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
