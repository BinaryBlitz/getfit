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

  test 'counter cache' do
    trainer = trainers(:trainer)
    follower = users(:baz)

    Trainer.reset_counters(trainer.id)

    assert_difference -> { trainer.reload.followers_count } do
      trainer.followings.create(user: follower)
    end

    assert_difference -> { trainer.reload.followers_count }, -1 do
      trainer.followings.last.destroy
    end
  end
end
