class AddScoreToHomework < ActiveRecord::Migration[5.2]
  def change
    add_column :homeworks, :score, :integer
  end
end
