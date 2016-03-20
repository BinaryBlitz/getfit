require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
  end

  test 'show current user' do
    get api_user_path, params: { api_token: api_token }
    assert_response :success
  end

  test 'show other user' do
    get api_user_path(@user), params: { api_token: api_token }
    assert_response :success
  end

  test 'update' do
    new_name = 'name'
    patch api_user_path(@user), params: { api_token: api_token, user: { first_name: new_name } }
    assert_response :ok
    assert_equal new_name, @user.reload.first_name
  end
end
