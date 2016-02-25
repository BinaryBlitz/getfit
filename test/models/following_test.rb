require 'test_helper'

class FollowingTest < ActiveSupport::TestCase
  setup do
    @following = followings(:following)
  end

  test 'valid' do
    assert @following.valid?
  end
end
