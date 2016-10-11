# == Schema Information
#
# Table name: conversations
#
#  id         :integer          not null, primary key
#  trainer_id :integer
#  admin_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  setup do
    @conversation = conversations(:conversation)
  end

  test 'valid' do
    assert @conversation.valid?
  end
end
