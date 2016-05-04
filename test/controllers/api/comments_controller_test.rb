require 'test_helper'

class API::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:comment)
    @post = @comment.post
  end

  test 'should create comment' do
    @comment.destroy

    assert_difference 'Comment.count' do
      post api_post_comments_url(@post), params: {
        api_token: api_token,
        comment: { content: @comment.content }
      }
    end

    assert_response :created
  end

  test 'should destroy comment' do
    assert_difference 'Comment.count', -1 do
      delete api_comment_url(@comment), params: { api_token: api_token }
    end

    assert_response :no_content
  end
end
