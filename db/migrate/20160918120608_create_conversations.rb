class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.belongs_to :trainer, foreign_key: true
      t.belongs_to :admin, foreign_key: true

      t.timestamps
    end
  end
end
