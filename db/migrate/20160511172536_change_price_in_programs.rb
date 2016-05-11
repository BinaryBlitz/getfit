class ChangePriceInPrograms < ActiveRecord::Migration[5.0]
  def change
    change_column :programs, :price, 'integer USING CAST(price AS integer)', default: 0
  end
end
