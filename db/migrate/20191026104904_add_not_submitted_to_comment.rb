class AddNotSubmittedToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :not_submitted, :boolean, :default => false
  end
end
