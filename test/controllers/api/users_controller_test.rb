require 'test_helper'

class API::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @verification_token = verification_tokens(:user_token)
    @user = users(:foo)
  end

  test 'should create user' do
    user = @verification_token.user.destroy

    assert_difference 'User.count' do
      post api_user_url, params: {
        user: user.attributes,
        verification_token: @verification_token.token
      }
    end

    assert_response :created
  end

  test 'should update user' do
    patch api_user_url(@user), params: {
      api_token: api_token,
      user: @user.attributes
    }

    assert_response :ok
  end

  test 'should set device token' do
    device_token_options = { device_token: SecureRandom.hex(64), platform: 'ios' }
    patch api_user_url(@user), params: { api_token: api_token, user: device_token_options }

    assert_response :ok

    @user.reload
    assert_equal device_token_options[:device_token], @user.device_token
    assert_equal device_token_options[:platform], @user.platform
  end

  test 'should reset device token' do
    device_token_options = { device_token: nil, platform: nil }
    patch api_user_url(@user), params: { api_token: api_token, user: device_token_options }

    assert_response :ok

    @user.reload
    assert_nil @user.device_token
    assert_nil @user.platform
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
