class AddRatingToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :rating, :float
  end
end
