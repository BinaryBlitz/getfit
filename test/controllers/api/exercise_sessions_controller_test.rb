require 'test_helper'

class API::ExerciseSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_session = exercise_sessions(:exercise_session)
    @workout_session = @exercise_session.workout_session
  end

  test 'should get index' do
    get api_workout_session_exercise_sessions_url(@workout_session), params: {
      api_token: api_token
    }
    assert_response :success
  end

  test 'should update exercise_session' do
    patch api_exercise_session_url(@exercise_session), params: {
      api_token: api_token,
      exercise_session: {
        completed: true
      }
    }

    assert_response :ok
    assert @exercise_session.reload.completed?
  end
end
