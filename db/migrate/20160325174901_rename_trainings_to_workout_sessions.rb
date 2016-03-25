class RenameTrainingsToWorkoutSessions < ActiveRecord::Migration[5.0]
  def change
    rename_table :trainings, :workout_sessions
  end
end
