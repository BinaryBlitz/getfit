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
          stage_id: @workout_session.stage_id,
          scheduled_for: @workout_session.scheduled_for
        }
      }
    end

    assert_response :created
  end
end
