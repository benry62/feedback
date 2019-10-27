class SortOutNotesAgain < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :student_id, :boolean

  end
end
