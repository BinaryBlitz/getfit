class CreateExerciseTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :exercise_types do |t|
      t.string :name, null: false
      t.string :video_url
      t.text :description, null: false
      t.belongs_to :trainer, foreign_key: true

      t.timestamps
    end
  end
end
