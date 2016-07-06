class AddFieldsToSubscription < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :condition, :string
    add_column :subscriptions, :weekly_load, :integer
    add_column :subscriptions, :goal, :string
    add_column :subscriptions, :location, :string
    add_column :subscriptions, :home_equipment, :string
  end
end
