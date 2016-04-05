class ChangeVkIdAndFbIdInUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :vk_id, :integer, limit: 8
    change_column :users, :fb_id, :integer, limit: 8
  end

  def down
    change_column :users, :vk_id, :integer
    change_column :users, :fb_id, :integer
  end
end
