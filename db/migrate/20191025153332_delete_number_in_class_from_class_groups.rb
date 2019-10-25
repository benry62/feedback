class DeleteNumberInClassFromClassGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :class_groups, :number_in_class, :integer
  end
end
