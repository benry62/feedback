class ChangeDefaultOnFlag < ActiveRecord::Migration[5.2]
  def change
    change_column_default :students, :flag, false

  end
end
