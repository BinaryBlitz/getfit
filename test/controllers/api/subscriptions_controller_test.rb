require 'test_helper'

class API::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:subscription)
    @trainer = @subscription.trainer
  end

  test 'should get index' do
    get api_subscriptions_url, params: { api_token: api_token }
    assert_response :success
  end

  test 'should create subscription' do
    @subscription.destroy

    assert_difference 'Subscription.count' do
      post api_trainer_subscription_url(@trainer), params: { api_token: api_token }
    end

    assert_response :created
  end
end
