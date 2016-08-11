# == Schema Information
#
# Table name: subscriptions
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  trainer_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  condition      :string
#  weekly_load    :integer
#  goal           :string
#  location       :string
#  home_equipment :string
#

require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  setup do
    @subscription = subscriptions(:subscription)
  end

  test 'valid' do
    assert @subscription.valid?
  end
end
