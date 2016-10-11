class AddViewedByTrainerAtToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :subscriptions, :viewed_by_trainer_at, :datetime
  end
end
