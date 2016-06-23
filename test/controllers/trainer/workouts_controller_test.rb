require 'test_helper'

class Trainer::WorkoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout = workouts(:workout)
    @program = @workout.program
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test 'should get index' do
    get trainer_program_workouts_url(@program)
    assert_response :success
  end

  test 'should get new' do
    get new_trainer_program_workout_url(@program)
    assert_response :success
  end

  test 'should create workout' do
    assert_difference('Workout.count') do
      post trainer_program_workouts_url(@program), params: {
        workout: {
          name: @workout.name,
          position: @workout.position,
          duration: @workout.duration,
          tips: @workout.tips
        }
      }
    end

    assert_redirected_to trainer_workout_exercises_url(Workout.last)
  end

  test 'should get edit' do
    get edit_trainer_workout_url(@workout)
    assert_response :success
  end

  test 'should update workout' do
    patch trainer_workout_url(@workout), params: {
      workout: { position: 2 }
    }
    assert_redirected_to trainer_workout_exercises_url(@workout)
  end

  test 'should destroy workout' do
    assert_difference('Workout.count', -1) do
      delete trainer_workout_url(@workout)
    end

    assert_redirected_to trainer_program_workouts_path(@workout.program)
  end
end
