require 'test_helper'

class Trainer::UserNotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:subscription)
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test 'create' do
    assert_difference 'UserNotification.count' do
      post trainer_subscription_user_notifications_path(@subscription),
           params: { api_token: api_token }
    end

    assert_redirected_to trainer_program_path(@subscription.program)
  end
end
