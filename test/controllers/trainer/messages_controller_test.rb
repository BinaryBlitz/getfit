require 'test_helper'

class Trainer::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:subscription)
    @message = messages(:message)
    @trainer = trainers(:trainer)
    sign_in_trainer(@trainer)
  end

  test "should get index" do
    get trainer_subscription_messages_url(@subscription)
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post trainer_subscription_messages_url(@subscription), params: {
        message: {
          content: @message.content,
          image: @message.image
        }
      }
    end

    assert_redirected_to trainer_subscription_messages_url(@subscription)
  end
end
