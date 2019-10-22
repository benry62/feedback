class RemoveIsArchiveFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :is_archive, :boolean
  end
end
