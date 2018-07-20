class DropForms < ActiveRecord::Migration[5.2]
  def change
    drop_table :forms
  end
end
