class AddMisconceptionsToHomework < ActiveRecord::Migration[5.2]
  def change
    add_column :homeworks, :misconception, :text
  end
end
