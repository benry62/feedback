class AddArchiveToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :is_archive, :boolean, :default => false
  end
end
