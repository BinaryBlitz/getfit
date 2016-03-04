# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  content     :text
#  post_id     :integer
#  author_type :string
#  author_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

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
