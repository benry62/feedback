class AddFlagToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :flag, :boolean
  end
end
