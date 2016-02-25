require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = comments(:comment)
  end

  test 'valid' do
    assert @comment.valid?
  end

  test 'content presence' do
    @comment.content = ''
    assert @comment.invalid?
  end
end
