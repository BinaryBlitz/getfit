class CreateTrainings < ActiveRecord::Migration[5.0]
  def change
    create_table :trainings do |t|
      t.references :user, foreign_key: true
      t.references :stage, foreign_key: true
      t.date :scheduled_for
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
