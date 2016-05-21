require 'test_helper'

class API::ProgramTypesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_program_types_url, params: { api_token: api_token }
    assert_response :success
  end
end
