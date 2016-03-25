require 'test_helper'

class API::RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rating = ratings(:rating)
    @program = @rating.program
  end

  test 'should create rating' do
    @rating.destroy

    assert_difference 'Rating.count' do
      post api_program_ratings_url(@program), params: {
        api_token: api_token,
        rating: @rating.attributes
      }
    end

    assert_response :created
    assert_equal @rating.value, Rating.last.value
    assert_equal @rating.content, Rating.last.content
  end

  test 'should update rating' do
    rating = { value: 1, content: 'New content' }
    patch api_rating_url(@rating), params: { api_token: api_token, rating: rating }

    assert_response :ok
    @rating.reload
    assert_equal rating[:value], @rating.value
    assert_equal rating[:content], @rating.content
  end

  test 'should destroy rating' do
    delete api_rating_url(@rating), params: { api_token: api_token }
    assert_response :no_content
  end
end
