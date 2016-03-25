require 'test_helper'

class API::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:like)
    @post = @like.post
  end

  test 'should create like' do
    @like.destroy

    assert_difference 'Like.count' do
      post api_post_likes_url(@post), params: { api_token: api_token }
    end

    assert_response :created
  end

  test 'should destroy like' do
    assert_difference 'Like.count', -1 do
      delete api_like_url(@like), params: { api_token: api_token }
    end

    assert_response :no_content
  end
end
