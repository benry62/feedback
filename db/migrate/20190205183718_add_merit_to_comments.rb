class AddMeritToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :merit, :boolean, :default => false
  end
end
