require 'test_helper'

class API::WorkoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout = workouts(:workout)
    @program = @workout.program
  end

  test 'should get index' do
    get api_workouts_url(@program), params: { api_token: api_token }
    assert_response :success
  end
end
