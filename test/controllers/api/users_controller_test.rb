require 'test_helper'

class API::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @verification_token = verification_tokens(:user_token)
    @user = users(:foo)
  end

  test 'should create' do
    user = @verification_token.user.destroy
    post api_user_url, params: {
      user: user.attributes,
      verification_token: @verification_token.token
    }
    assert_response :created
  end

  test 'should show current user' do
    get api_user_url, params: { api_token: api_token }
    assert_response :success
  end

  test 'should show user' do
    get "/api/users/#{@user.id}", params: { api_token: api_token }
    assert_response :success
  end
end
