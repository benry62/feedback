class SortOutNotesAgainAgainAgain < ActiveRecord::Migration[5.2]
  def change
    remove_column :notes, :student_id, :boolean
    remove_column :notes, :homework_id, :boolean
    add_column :notes, :comment_id, :integer
  end
end
