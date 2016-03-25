# == Schema Information
#
# Table name: trainings
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

class TrainingTest < ActiveSupport::TestCase
  setup do
    @training = trainings(:training)
  end
end
