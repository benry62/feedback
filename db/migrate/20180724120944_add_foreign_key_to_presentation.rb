class AddForeignKeyToPresentation < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :presentations, :presentation_items
    add_foreign_key :presentations, :comments
  end
end
