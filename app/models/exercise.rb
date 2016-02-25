# == Schema Information
#
# Table name: exercises
#
#  id               :integer          not null, primary key
#  program_id       :integer
#  exercise_type_id :integer
#  sets             :integer
#  reps             :integer
#  weight           :integer
#  distance         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Exercise < ApplicationRecord
  belongs_to :program
  belongs_to :exercise_type

  validates :sets, :reps, :weight, :distance, numericality: { greater_than: 0 }, allow_nil: true
end
