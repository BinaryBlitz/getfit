class ChangeApprovedInPrograms < ActiveRecord::Migration[5.0]
  def up
    change_column :programs, :approved, :boolean, default: nil
  end

  def down
    change_column :programs, :approved, :boolean, default: false
  end
end
