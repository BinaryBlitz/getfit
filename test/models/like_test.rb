require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  setup do
    @like = likes(:like)
  end

  test 'valid' do
    assert @like.valid?
  end
end
