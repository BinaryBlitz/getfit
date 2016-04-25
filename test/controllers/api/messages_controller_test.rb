require 'test_helper'

class API::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscription = subscriptions(:subscription)
  end

  test 'should get index' do
    get api_subscription_messages_url(@subscription), params: { api_token: api_token }
    assert_response :success
  end
end
