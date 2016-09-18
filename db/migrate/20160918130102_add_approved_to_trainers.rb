class AddApprovedToTrainers < ActiveRecord::Migration[5.0]
  def change
    add_column :trainers, :approved, :boolean
  end
end
