require 'test_helper'

class API::SpecializationsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get api_specializations_url, params: { api_token: api_token }
    assert_response :success
  end
end
