class CreateStages < ActiveRecord::Migration[5.0]
  def change
    create_table :stages do |t|
      t.belongs_to :stageable, index: true, polymorphic: true
      t.integer :position

      t.timestamps
    end
  end
end
