require 'test_helper'

class API::StatisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
  end

  test 'should get index' do
    get api_user_statistics_path(@user), params: { api_token: api_token }
    assert_response :success
  end
end
