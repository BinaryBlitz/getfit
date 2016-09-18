require 'test_helper'

class Admin::TrainersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trainer = trainers(:trainer)
    sign_in_admin
  end

  test 'should get index' do
    get admin_trainers_url
    assert_response :success
  end

  test 'should show trainer' do
    get admin_trainer_path(@trainer)
    assert_response :success
  end

  test 'should approve trainer' do
    patch approve_admin_trainer_path(@trainer)
    assert_redirected_to admin_trainer_path(@trainer)
  end

  test 'should reject trainer' do
    patch reject_admin_trainer_path(@trainer)
    assert_redirected_to admin_trainer_path(@trainer)
  end
end
