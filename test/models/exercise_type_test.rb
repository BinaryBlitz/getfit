# == Schema Information
#
# Table name: exercise_types
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  video_url   :string
#  description :text             not null
#  trainer_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tips        :text
#

require 'test_helper'

class ExerciseTypeTest < ActiveSupport::TestCase
  setup do
    @exercise_type = exercise_types(:exercise_type)
  end

  test 'valid' do
    assert @exercise_type.valid?
  end
end
