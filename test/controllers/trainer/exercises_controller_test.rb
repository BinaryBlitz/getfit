require 'test_helper'

class ExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise = exercises(:exercise)
    @program = @exercise.program
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test "should get index" do
    get trainer_program_exercises_url(@program)
    assert_response :success
  end

  test "should get new" do
    get new_trainer_program_exercise_url(@program)
    assert_response :success
  end

  test "should create exercise" do
    assert_difference('Exercise.count') do
      post trainer_program_exercises_url(@program), params: {
        exercise: {
          exercise_type_id: @exercise.exercise_type_id,
          sets: @exercise.sets,
          reps: @exercise.reps,
          weight: @exercise.weight,
          distance: @exercise.distance
        }
      }
    end

    assert_redirected_to trainer_program_exercises_url(@program)
  end

  test "should show exercise" do
    get trainer_exercise_url(@exercise)
    assert_response :success
  end

  test "should get edit" do
    get edit_trainer_exercise_url(@exercise)
    assert_response :success
  end

  test "should update exercise" do
    patch trainer_exercise_url(@exercise), params: { exercise: { sets: 1 } }
    assert_redirected_to trainer_program_exercises_url(@program)
  end

  test "should destroy exercise" do
    assert_difference('Exercise.count', -1) do
      delete trainer_exercise_url(@exercise)
    end

    assert_redirected_to trainer_program_exercises_url(@program)
  end
end
