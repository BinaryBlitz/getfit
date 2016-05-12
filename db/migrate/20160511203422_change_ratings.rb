class ChangeRatings < ActiveRecord::Migration[5.0]
  def change
    remove_reference :ratings, :program
    add_reference :ratings, :ratable, polymorphic: true
  end
end
