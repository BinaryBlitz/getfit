# == Schema Information
#
# Table name: workout_sessions
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  stage_id      :integer
#  scheduled_for :date
#  completed     :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class WorkoutSessionTest < ActiveSupport::TestCase
  setup do
    @workout_session = workout_sessions(:workout_session)
  end
end
