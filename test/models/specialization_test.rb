# == Schema Information
#
# Table name: specializations
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SpecializationTest < ActiveSupport::TestCase
  setup do
    @specialization = specializations(:specialization)
  end

  test 'valid' do
    assert @specialization.valid?
  end

  test 'name presence' do
    @specialization.name = nil
    assert @specialization.invalid?

    @specialization.name = ''
    assert @specialization.invalid?

    @specialization.name = 'Specialization'
    assert @specialization.valid?
  end
end
