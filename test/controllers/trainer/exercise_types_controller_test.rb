require 'test_helper'

class ExerciseTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_type = exercise_types(:exercise_type)
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test "should get index" do
    get trainer_exercise_types_url
    assert_response :success
  end

  test "should get new" do
    get new_trainer_exercise_type_url
    assert_response :success
  end

  test "should create exercise_type" do
    assert_difference('ExerciseType.count') do
      post trainer_exercise_types_url, params: {
        exercise_type: {
          name: @exercise_type.name,
          description: @exercise_type.description,
          video_url: @exercise_type.video_url
        }
      }
    end

    assert_redirected_to trainer_exercise_type_path(ExerciseType.last)
  end

  test "should show exercise_type" do
    get trainer_exercise_type_url(@exercise_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_trainer_exercise_type_url(@exercise_type)
    assert_response :success
  end

  test "should update exercise_type" do
    patch trainer_exercise_type_url(@exercise_type), params: {
      exercise_type: {
        name: 'New name'
      }
    }
    assert_redirected_to trainer_exercise_type_path(@exercise_type)
  end

  test "should destroy exercise_type" do
    assert_difference('ExerciseType.count', -1) do
      delete trainer_exercise_type_url(@exercise_type)
    end

    assert_redirected_to trainer_exercise_types_path
  end
end
