class AddApprovedToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :approved, :boolean, default: false
  end
end
