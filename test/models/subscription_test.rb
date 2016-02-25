require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  setup do
    @subscription = subscriptions(:subscription)
  end

  test 'valid' do
    assert @subscription.valid?
  end
end
