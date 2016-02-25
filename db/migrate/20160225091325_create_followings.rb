class CreateFollowings < ActiveRecord::Migration[5.0]
  def change
    create_table :followings do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :trainer, foreign_key: true

      t.timestamps
    end
  end
end