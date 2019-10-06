class AddResultToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :result, :integer
  end
end
