require 'test_helper'

class API::RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_rating = ratings(:program_rating)
    @trainer_rating = ratings(:trainer_rating)
  end

  test 'should create program rating' do
    @program_rating.destroy

    assert_difference 'Rating.count' do
      post api_program_ratings_url(@program_rating.ratable), params: {
        api_token: api_token,
        rating: @program_rating.attributes
      }
    end

    assert_response :created
    assert_equal @program_rating.value, Rating.last.value
    assert_equal @program_rating.content, Rating.last.content
  end

  test 'should create trainer rating' do
    @trainer_rating.destroy

    assert_difference 'Rating.count' do
      post api_trainer_ratings_url(@trainer_rating.ratable), params: {
        api_token: api_token,
        rating: @trainer_rating.attributes
      }
    end

    assert_response :created
    assert_equal @trainer_rating.value, Rating.last.value
    assert_equal @trainer_rating.content, Rating.last.content
  end

  test 'should update rating' do
    rating = { value: 1, content: 'New content' }
    patch api_rating_url(@program_rating), params: { api_token: api_token, rating: rating }

    assert_response :ok
    @program_rating.reload
    assert_equal rating[:value], @program_rating.value
    assert_equal rating[:content], @program_rating.content
  end

  test 'should destroy rating' do
    delete api_rating_url(@program_rating), params: { api_token: api_token }
    assert_response :no_content
  end
end
