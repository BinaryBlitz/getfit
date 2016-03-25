class AddContentToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :content, :text
  end
end
