require 'test_helper'

class API::TrainingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training = trainings(:training)
  end

  test 'should get index' do
    get api_trainings_url, params: { api_token: api_token }
    assert_response :success
  end

  test 'should show training' do
    get api_training_url(@training), params: { api_token: api_token }
    assert_response :success
  end

  test 'should create training' do
    assert_difference('Training.count') do
      post api_trainings_url, params: {
        api_token: api_token,
        training: {
          stage_id: @training.stage_id,
          scheduled_for: @training.scheduled_for
        }
      }
    end

    assert_response :created
  end
end
