require 'test_helper'

class Trainer::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:subscription)
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test "should get index" do
    get trainer_subscriptions_url
    assert_response :success
  end

  test "should show subscription" do
    get trainer_subscription_url(@subscription)
    assert_response :success
  end
end
