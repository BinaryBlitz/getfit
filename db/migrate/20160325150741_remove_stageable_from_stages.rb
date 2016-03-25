class RemoveStageableFromStages < ActiveRecord::Migration[5.0]
  def change
    remove_reference :stages, :stageable, index: true, polymorphic: true
    add_reference :stages, :program, index: true
  end
end
