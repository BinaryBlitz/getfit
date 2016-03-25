require 'test_helper'

class Trainer::StagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stage = stages(:stage)
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test 'should get index' do
    get trainer_stages_url
    assert_response :success
  end

  test 'should get new' do
    get new_trainer_stage_url
    assert_response :success
  end

  test 'should create trainer_stage' do
    assert_difference('Trainer::Stage.count') do
      post trainer_stages_url, params: { trainer_stage: {  } }
    end

    assert_redirected_to trainer_stage_path(Trainer::Stage.last)
  end

  test 'should show trainer_stage' do
    get trainer_stage_url(@stage)
    assert_response :success
  end

  test 'should get edit' do
    get edit_trainer_stage_url(@stage)
    assert_response :success
  end

  test 'should update trainer_stage' do
    patch trainer_stage_url(@stage), params: { trainer_stage: {  } }
    assert_redirected_to trainer_stage_path(@stage)
  end

  test 'should destroy trainer_stage' do
    assert_difference('Trainer::Stage.count', -1) do
      delete trainer_stage_url(@stage)
    end

    assert_redirected_to trainer_stages_path
  end
end
