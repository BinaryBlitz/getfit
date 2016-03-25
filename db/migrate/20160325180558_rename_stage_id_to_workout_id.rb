class RenameStageIdToWorkoutId < ActiveRecord::Migration[5.0]
  def change
    rename_column :exercises, :stage_id, :workout_id
    rename_column :workout_sessions, :stage_id, :workout_id
  end
end
