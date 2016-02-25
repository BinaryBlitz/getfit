class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.belongs_to :program, foreign_key: true
      t.belongs_to :exercise_type, foreign_key: true
      t.integer :sets
      t.integer :reps
      t.integer :weight
      t.integer :distance

      t.timestamps
    end
  end
end
