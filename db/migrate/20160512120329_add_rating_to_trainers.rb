class AddRatingToTrainers < ActiveRecord::Migration[5.0]
  def change
    add_column :trainers, :rating, :float
  end
end
