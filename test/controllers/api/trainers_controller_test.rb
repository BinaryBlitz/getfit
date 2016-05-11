require 'test_helper'

class API::TrainersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trainer = trainers(:trainer)
  end

  test 'should get index' do
    get api_trainers_url, params: { api_token: api_token }
    assert_response :success
  end

  test 'should get programs' do
    get api_trainer_programs_url(@trainer), params: { api_token: api_token }
    assert_response :success
  end

  test 'should get posts' do
    get api_trainer_posts_url(@trainer), params: { api_token: api_token }
    assert_response :success
  end
end
