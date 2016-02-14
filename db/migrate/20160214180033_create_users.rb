class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :phone_number, null: false
      t.text :description
      t.string :avatar
      t.string :banner
      t.integer :height, null: false
      t.integer :weight, null: false
      t.date :birthdate, null: false
      t.string :gender, null: false
      t.string :api_token, null: false

      t.timestamps
    end
  end
end
