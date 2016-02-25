require 'test_helper'

class ExerciseTypeTest < ActiveSupport::TestCase
  setup do
    @exercise_type = exercise_types(:exercise_type)
  end

  test 'valid' do
    assert @exercise_type.valid?
  end
end
