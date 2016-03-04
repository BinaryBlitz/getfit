# == Schema Information
#
# Table name: followings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  trainer_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class FollowingTest < ActiveSupport::TestCase
  setup do
    @following = followings(:following)
  end

  test 'valid' do
    assert @following.valid?
  end
end
