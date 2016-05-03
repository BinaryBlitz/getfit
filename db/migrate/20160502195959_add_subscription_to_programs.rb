class AddSubscriptionToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_reference :programs, :subscription
  end
end
