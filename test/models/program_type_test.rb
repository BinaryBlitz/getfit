# == Schema Information
#
# Table name: program_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProgramTypeTest < ActiveSupport::TestCase
  setup do
    @program_type = program_types(:program_type)
  end

  test 'valid' do
    assert @program_type.valid?
  end
end
