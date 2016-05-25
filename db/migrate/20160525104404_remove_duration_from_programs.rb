class RemoveDurationFromPrograms < ActiveRecord::Migration[5.0]
  def change
    remove_column :programs, :duration, :string
  end
end
