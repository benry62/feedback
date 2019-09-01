class AddArchiveToHomeworks < ActiveRecord::Migration[5.2]
  def change
    add_column :homeworks, :is_archive, :boolean, :default => false
  end
end
