require 'test_helper'

class Admin::WorkoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workout = workouts(:workout)
    @program = @workout.program
    @admin = admins(:admin)
    sign_in_admin
  end

  test 'should get index' do
    get admin_program_workouts_url(@program)
    assert_response :success
  end
end
