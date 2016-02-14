class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :image, null: false
      t.belongs_to :trainer, foreign_key: true

      t.timestamps
    end
  end
end
