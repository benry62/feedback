class AddIsArchiveToClasses < ActiveRecord::Migration[5.2]
  def change
    add_column :class_groups, :is_archive, :boolean
  end
end
