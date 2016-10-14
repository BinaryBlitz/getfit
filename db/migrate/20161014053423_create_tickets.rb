class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.text :content, null: false
      t.string :category, null: false
      t.string :image
      t.belongs_to :conversation, foreign_key: true

      t.timestamps
    end
  end
end
