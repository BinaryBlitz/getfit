require 'test_helper'

class RatingTest < ActiveSupport::TestCase
  setup do
    @rating = ratings(:rating)
  end

  test 'valid' do
    assert @rating.valid?
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
end
