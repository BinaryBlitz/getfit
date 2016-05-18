class AddNameToWorkouts < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :name, :string, null: false
  end
end
