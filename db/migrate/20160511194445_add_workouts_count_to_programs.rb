class AddWorkoutsCountToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :workouts_count, :integer, default: 0
  end
end
