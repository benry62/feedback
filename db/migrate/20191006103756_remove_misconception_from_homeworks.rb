class RemoveMisconceptionFromHomeworks < ActiveRecord::Migration[5.2]
  def change
    remove_column :homeworks, :misconception, :text
  end
end
