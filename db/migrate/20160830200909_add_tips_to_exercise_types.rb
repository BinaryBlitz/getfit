class AddTipsToExerciseTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :exercise_types, :tips, :text
  end
end
