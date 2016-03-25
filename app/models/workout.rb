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

class Workout < ApplicationRecord
  belongs_to :program, optional: true

  has_many :exercises, dependent: :destroy
  has_many :workout_sessions, dependent: :destroy
end
