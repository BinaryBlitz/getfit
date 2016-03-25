class AddDeviceTokenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :device_token, :string
    add_column :users, :platform, :string
  end
end
