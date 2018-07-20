class TweakComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :date, :date
    remove_column :comments, :title, :text
    add_column :comments, :homework_id, :integer
  end
end
