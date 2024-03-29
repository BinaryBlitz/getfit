require 'test_helper'

class Trainer::ExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise = exercises(:exercise)
    @workout = @exercise.workout
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test "should get index" do
    get trainer_workout_exercises_url(@workout)
    assert_response :success
  end

  test "should get new" do
    get new_trainer_workout_exercise_url(@workout)
    assert_response :success
  end

  test "should create exercise" do
    assert_difference('Exercise.count') do
      post trainer_workout_exercises_url(@workout), params: {
        exercise: {
          exercise_type_id: @exercise.exercise_type_id,
          sets: @exercise.sets,
          reps: @exercise.reps,
          weight: @exercise.weight,
          distance: @exercise.distance
        }
      }
    end

    assert_redirected_to trainer_workout_exercises_url(@workout)
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
    assert_redirected_to trainer_workout_exercises_url(@workout)
  end

  test "should destroy exercise" do
    assert_difference('Exercise.count', -1) do
      delete trainer_exercise_url(@exercise)
    end

    assert_redirected_to trainer_workout_exercises_url(@workout)
  end
end
