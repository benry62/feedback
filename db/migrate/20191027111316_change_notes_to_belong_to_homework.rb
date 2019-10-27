class ChangeNotesToBelongToHomework < ActiveRecord::Migration[5.2]
  def change
    rename_column :notes, :student_id, :homework_id
  end
end
