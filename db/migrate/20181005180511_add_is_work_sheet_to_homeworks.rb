class AddIsWorkSheetToHomeworks < ActiveRecord::Migration[5.2]
  def change
    add_column :homeworks, :is_worksheet, :boolean
  end
end
