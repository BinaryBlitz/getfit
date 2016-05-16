require 'test_helper'

class API::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:subscription)
    @message = messages(:message)
  end

  test 'should get index' do
    get api_subscription_messages_url(@subscription), params: { api_token: api_token }
    assert_response :success
  end

  test 'should create message' do
    assert_difference 'Message.count' do
      post api_subscription_messages_url(@subscription), params: {
        api_token: api_token,
        message: { content: @message.content }
      }
    end

    assert_response :created
  end
end
