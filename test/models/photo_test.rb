# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  image      :string           not null
#  trainer_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  setup do
    @photo = photos(:photo)
  end

  test 'valid' do
    assert @photo.valid?
  end
end
