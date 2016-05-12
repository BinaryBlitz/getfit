class ChangeRatables < ActiveRecord::Migration[5.0]
  def up
    change_column :programs, :rating, :float, default: 0
    change_column :trainers, :rating, :float, default: 0
  end

  def down
    change_column :programs, :rating, :float, default: nil
    change_column :trainers, :rating, :float, default: nil
  end
end
