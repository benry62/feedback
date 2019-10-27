class SortOutNotesAgainAgain < ActiveRecord::Migration[5.2]
  def change
    change_column_default :notes, :is_archive, false
    remove_column :notes, :student_id, :boolean
    add_column :notes, :student_id, :integer
  end
end
