class CreatePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :programs do |t|
      t.string :name, null: false
      t.string :preview, null: false
      t.text :description, null: false
      t.string :banner, null: false
      t.integer :duration, null: false
      t.integer :price, null: false
      t.belongs_to :trainer, foreign_key: true
      t.belongs_to :program_type, foreign_key: true

      t.timestamps
    end
  end
end
