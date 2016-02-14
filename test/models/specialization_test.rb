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
