require 'test_helper'

class API::ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program = programs(:program)
  end

  test 'should get index' do
    get api_programs_url, params: { api_token: api_token }
    assert_response :success
  end

  test 'should show program' do
    get api_program_url(@program), params: { api_token: api_token }
    assert_response :success
  end
end
