# == Schema Information
#
# Table name: messages
#
#  id               :integer          not null, primary key
#  content          :text             not null
#  category         :string           not null
#  image            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  messageable_type :string
#  messageable_id   :integer
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  setup do
    @message = messages(:message)
  end

  test 'valid' do
    assert @message.valid?
  end

  test 'invalid without content' do
    @message.content = nil
    assert @message.invalid?

    @message.content = ''
    assert @message.invalid?
  end

  test 'category from list' do
    valid_categories = %w(user trainer admin)
    valid_categories.each do |category|
      @message.category = category
      assert @message.valid?
    end

    @message.category = 'a'
    assert @message.invalid?
  end
end
