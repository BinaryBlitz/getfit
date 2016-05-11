# == Schema Information
#
# Table name: purchases
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase
  setup do
    @purchase = purchases(:purchase)
  end

  test 'valid' do
    assert @purchase.valid?
  end

  test 'uniqueness' do
    purchase = @purchase.dup

    assert purchase.invalid?
  end
end
