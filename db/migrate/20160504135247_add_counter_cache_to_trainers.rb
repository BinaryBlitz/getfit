class AddCounterCacheToTrainers < ActiveRecord::Migration[5.0]
  def change
    add_column :trainers, :programs_count, :integer, default: 0
  end
end
