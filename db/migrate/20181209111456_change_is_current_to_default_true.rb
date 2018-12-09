class ChangeIsCurrentToDefaultTrue < ActiveRecord::Migration[5.2]
  def change
    change_column_default :students, :is_current, true
  end
end
