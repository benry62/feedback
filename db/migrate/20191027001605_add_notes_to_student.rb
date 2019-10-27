class AddNotesToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :notes, :text
  end
end
