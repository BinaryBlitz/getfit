# == Schema Information
#
# Table name: workouts
#
#  id              :integer          not null, primary key
#  position        :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  program_id      :integer
#  duration        :integer
#  exercises_count :integer          default(0)
#  name            :string           not null
#  tips            :text
#

class Workout < ApplicationRecord
  belongs_to :program, counter_cache: true, touch: true

  has_many :exercises, dependent: :destroy
  has_many :workout_sessions, dependent: :destroy

  validates :name, :tips, presence: true
  validates :duration, numericality: { greater_than: 0 }, allow_nil: true
end
