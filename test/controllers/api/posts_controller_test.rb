require 'test_helper'

class API::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:post)
  end

  test 'should get index' do
    get api_posts_url, params: { api_token: api_token }
    assert_response :success
  end

  test 'should get popular posts without token' do
    get popular_api_posts_url
    assert_response :success
  end

  test 'should show post' do
    get api_post_url(@post), params: { api_token: api_token }
    assert_response :success
  end
end
