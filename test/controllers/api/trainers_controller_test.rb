require 'test_helper'

class API::TrainersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trainer = trainers(:trainer)
  end

  test 'should get index' do
    get api_trainers_url, params: { api_token: api_token }
    assert_response :success
  end
end
