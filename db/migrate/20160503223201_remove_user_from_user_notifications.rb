class RemoveUserFromUserNotifications < ActiveRecord::Migration[5.0]
  def up
    remove_reference :user_notifications, :user, foreign_key: true
  end

  def down
    add_reference :user_notifications, :user, foreign_key: true
  end
end
