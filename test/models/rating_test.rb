# == Schema Information
#
# Table name: ratings
#
#  id           :integer          not null, primary key
#  value        :integer          not null
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  content      :text
#  ratable_type :string
#  ratable_id   :integer
#

require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  setup do
    @rating = ratings(:program_rating)
    @rating.send(:update_rating_cache)
  end

  test 'valid' do
    assert @rating.valid?
  end

  test 'content is either present or empty' do
    @rating.content = nil
    assert @rating.valid?

    @rating.content = ''
    assert @rating.invalid?
  end

  test 'value is in range from 1 to 5' do
    invalid_values = [-1, 0, 6]
    invalid_values.each do |value|
      @rating.value = value
      assert @rating.invalid?
    end

    valid_values = 1..5
    valid_values.each do |value|
      @rating.value = value
      assert @rating.valid?
    end
  end

  test 'rating cache is updated after create and destroy' do
    current_rating = @rating.ratable.rating

    assert_difference -> { @rating.ratable.reload.rating }, -current_rating do
      @rating.ratable.ratings.destroy_all
    end
  end
end
