class AddThingsToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :is_pp, :boolean
    add_column :students, :is_sen, :boolean
    remove_column :students, :notes, :text
  end
end
