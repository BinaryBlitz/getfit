class RenameStagesToWorkouts < ActiveRecord::Migration[5.0]
  def change
    rename_table :stages, :workouts
  end
end
