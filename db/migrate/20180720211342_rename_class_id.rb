class RenameClassId < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :class_id, :class_group_id

  end
end
