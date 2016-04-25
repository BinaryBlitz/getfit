class CreateUserNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :user_notifications do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :subscription, foreign_key: true

      t.timestamps
    end
  end
end
