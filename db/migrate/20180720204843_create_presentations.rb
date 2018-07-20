class CreatePresentations < ActiveRecord::Migration[5.2]
  def change
    create_table :presentations do |t|
      t.integer :comment_id
      t.integer :presentation_item_id
      t.boolean :status

      t.timestamps
    end
  end
end
