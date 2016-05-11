class AddUsersCountToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :users_count, :integer, default: 0
  end
end
