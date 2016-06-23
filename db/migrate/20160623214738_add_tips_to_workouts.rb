class AddTipsToWorkouts < ActiveRecord::Migration[5.0]
  def change
    add_column :workouts, :tips, :text
  end
end
