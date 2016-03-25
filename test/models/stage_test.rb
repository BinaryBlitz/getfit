# == Schema Information
#
# Table name: stages
#
#  id         :integer          not null, primary key
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :integer
#

require 'test_helper'

class StageTest < ActiveSupport::TestCase
  setup do
    @stage = stages(:stage)
  end
end
