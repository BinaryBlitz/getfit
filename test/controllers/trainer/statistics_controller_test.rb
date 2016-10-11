require 'test_helper'

class Trainer::StatisticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test 'should get index' do
    get trainer_statistics_url(@trainer)
    assert_response :success
  end
end
