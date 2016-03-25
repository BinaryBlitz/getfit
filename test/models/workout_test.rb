# == Schema Information
#
# Table name: workouts
#
#  id         :integer          not null, primary key
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  program_id :integer
#

require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  setup do
    @workout = workouts(:workout)
  end
end
