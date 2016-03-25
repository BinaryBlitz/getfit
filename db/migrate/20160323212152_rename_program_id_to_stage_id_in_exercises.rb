class RenameProgramIdToStageIdInExercises < ActiveRecord::Migration[5.0]
  def change
    remove_column :exercises, :program_id, :integer, index: true
    add_reference :exercises, :stage, index: true, foreign_key: true
  end
end
