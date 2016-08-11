class AddDurationToExercises < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :duration, :integer
    add_column :exercise_sessions, :duration, :integer
  end
end
