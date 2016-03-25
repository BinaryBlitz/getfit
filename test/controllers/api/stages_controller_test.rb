require 'test_helper'

class API::StagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stage = stages(:stage)
    @program = @stage.program
  end

  test 'should get index' do
    get api_program_stages_url(@program), params: { api_token: api_token }
    assert_response :success
  end

  test 'should show stage' do
    get api_stage_url(@stage), params: { api_token: api_token }
    assert_response :success
  end
end
