require 'test_helper'

class API::WorkoutSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout_session = workout_sessions(:workout_session)
  end

  test 'should get index' do
    get api_workout_sessions_url, params: { api_token: api_token }
    assert_response :success
  end

  test 'should show workout_session' do
    get api_workout_session_url(@workout_session), params: { api_token: api_token }
    assert_response :success
  end

  test 'should create workout_session' do
    assert_difference('WorkoutSession.count') do
      post api_workout_sessions_url, params: {
        api_token: api_token,
        workout_session: {
          workout_id: @workout_session.workout_id,
          scheduled_for: @workout_session.scheduled_for
        }
      }
    end

    assert_response :created
  end

  test 'should update workout_session' do
    patch api_workout_session_url(@workout_session), params: {
      api_token: api_token,
      workout_session: { completed: true }
    }

    assert_response :ok
    assert @workout_session.reload.completed?
  end

  test 'should destroy workout_session' do
    assert_difference('WorkoutSession.count', -1) do
      delete api_workout_session_path(@workout_session), params: { api_token: api_token }
    end

    assert_response :no_content
  end
end
