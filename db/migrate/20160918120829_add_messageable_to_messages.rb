class AddMessageableToMessages < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :messageable, polymorphic: true, index: true
  end
end
