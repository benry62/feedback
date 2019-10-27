class RenameColumnInNotes < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :archive, :is_archive
  end
end
