require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @post = posts(:post)
  end

  test 'valid' do
    assert @post.valid?
  end

  test 'content presence' do
    @post.content = ''
    assert @post.invalid?
  end
end
