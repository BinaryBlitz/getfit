class AddImageToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :image, :string
  end
end
