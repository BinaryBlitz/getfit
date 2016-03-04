# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  image      :string           not null
#  trainer_id :integer
#  program_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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
