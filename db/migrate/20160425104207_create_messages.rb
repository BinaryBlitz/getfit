class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.string :category, null: false
      t.belongs_to :subscription, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
