class DropLikes < ActiveRecord::Migration[5.0]
  def change
    drop_table :likes
    remove_column :posts, :likes_count
  end
end
