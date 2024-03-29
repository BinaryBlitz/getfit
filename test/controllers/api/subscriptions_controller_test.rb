require 'test_helper'

class API::SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:subscription)
    @trainer = @subscription.trainer
  end

  test 'should get index' do
    get api_subscriptions_url(api_token: api_token)
    assert_response :success
  end

  test 'should create subscription' do
    @subscription.destroy
    attributes = %w(condition weekly_load goal location home_equipment expires_on)

    assert_difference 'Subscription.count' do
      post api_trainer_subscription_url(@trainer, api_token: api_token), params: {
        subscription: @subscription.attributes.slice(*attributes)
      }
    end

    assert_response :created
  end

  test 'should update questionnaire' do
    questionnaire_attributes = %w(condition weekly_load goal location home_equipment)

    patch api_subscription_path(@subscription, api_token: api_token), params: {
      subscription: @subscription.attributes.slice(*questionnaire_attributes)
    }
    assert_response :ok
  end
end
