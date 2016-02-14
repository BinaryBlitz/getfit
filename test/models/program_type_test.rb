require 'test_helper'

class ProgramTypeTest < ActiveSupport::TestCase
  setup do
    @program_type = program_types(:program_type)
  end

  test 'valid' do
    assert @program_type.valid?
  end
end
