require 'test_helper'

class API::FollowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @following = followings(:following)
    @trainer = trainers(:trainer)
  end

  test 'should create following' do
    @following.destroy

    assert_difference 'Following.count' do
      post api_trainer_followings_url(@trainer), params: { api_token: api_token }
    end

    assert_response :created
  end

  test 'should destroy following' do
    assert_difference 'Following.count', -1 do
      delete api_following_url(@following), params: { api_token: api_token }
    end

    assert_response :no_content
  end
end
