class RemoveForeignKeyToPresentation < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :presentations, :presentation_items
    remove_foreign_key :presentations, :comments
  end
end
