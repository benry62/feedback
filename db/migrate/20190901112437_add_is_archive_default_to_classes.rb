class AddIsArchiveDefaultToClasses < ActiveRecord::Migration[5.2]
  def change
    change_column_default :class_groups, :is_archive, false
  end
end
