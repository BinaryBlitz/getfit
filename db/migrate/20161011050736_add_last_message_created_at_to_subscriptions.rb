class AddLastMessageCreatedAtToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :last_message_created_at, :datetime
  end
end
