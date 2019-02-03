class AddResubmitToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :resubmit, :boolean, :default => false
  end
end
