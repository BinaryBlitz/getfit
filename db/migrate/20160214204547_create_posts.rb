class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :content, null: false
      t.string :image, null: false
      t.belongs_to :trainer, foreign_key: true
      t.belongs_to :program, foreign_key: true

      t.timestamps
    end
  end
end
