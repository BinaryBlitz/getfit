require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  setup do
    @photo = photos(:photo)
  end

  test 'valid' do
    assert @photo.valid?
  end
end
