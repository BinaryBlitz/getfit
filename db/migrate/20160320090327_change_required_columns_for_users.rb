class ChangeRequiredColumnsForUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :height, :integer, null: true
    change_column :users, :weight, :integer, null: true
    change_column :users, :birthdate, :date, null: true
    change_column :users, :gender, :string, null: true
    change_column :users, :phone_number, :string, null: true
  end

  def down
    change_column :users, :height, :integer, null: false
    change_column :users, :weight, :integer, null: false
    change_column :users, :birthdate, :date, null: false
    change_column :users, :gender, :string, null: false
    change_column :users, :phone_number, :string, null: false
  end
end
