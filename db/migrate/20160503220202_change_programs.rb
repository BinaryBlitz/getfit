class ChangePrograms < ActiveRecord::Migration[5.0]
  def up
    change_column :programs, :preview, :string, null: true
    change_column :programs, :description, :text, null: true
    change_column :programs, :banner, :string, null: true
    change_column :programs, :duration, :string, null: true
    change_column :programs, :price, :string, null: true
  end
end
