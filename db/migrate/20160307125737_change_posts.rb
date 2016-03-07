class ChangePosts < ActiveRecord::Migration[5.0]
  def up
    change_column :posts, :image, :string, null: true
  end

  def down
    change_column :posts, :image, :string, null: false
  end
end
