class AddDurationToWorkouts < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :duration, :integer
    add_column :workouts, :exercises_count, :integer, default: 0
  end
end
