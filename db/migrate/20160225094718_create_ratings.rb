class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :value, null: false
      t.belongs_to :program, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
