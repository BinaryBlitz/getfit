class ChangeDurationInPrograms < ActiveRecord::Migration[5.0]
  def up
    change_column :programs, :duration, 'integer USING CAST(duration AS integer)', default: 0
  end
end
