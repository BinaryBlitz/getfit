class CreateExerciseSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_sessions do |t|
      t.references :exercise, foreign_key: true
      t.references :workout_session, foreign_key: true
      t.integer :sets
      t.integer :reps
      t.integer :weight
      t.integer :distance
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
