require 'test_helper'

class Trainer::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:post)
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test "should get index" do
    get trainer_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_trainer_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do
      post trainer_posts_url, params: { post: { content: @post.content } }
    end

    assert_redirected_to trainer_post_path(Post.last)
  end

  test "should show post" do
    get trainer_post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_trainer_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch trainer_post_url(@post), params: { post: { content: @post.content } }
    assert_redirected_to trainer_post_path(@post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete trainer_post_url(@post)
    end

    assert_redirected_to trainer_posts_path
  end
end
