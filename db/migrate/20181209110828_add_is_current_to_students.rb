class AddIsCurrentToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :is_current, :boolean
  end
end
