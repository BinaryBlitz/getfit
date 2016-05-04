require 'test_helper'

class API::ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program = programs(:program)
  end

  test 'should get index without token' do
    get api_programs_url
    assert_response :success
  end

  test 'should show program without token' do
    get api_program_url(@program)
    assert_response :success
  end
end
