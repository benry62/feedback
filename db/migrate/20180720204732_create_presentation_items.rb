class CreatePresentationItems < ActiveRecord::Migration[5.2]
  def change
    create_table :presentation_items do |t|
      t.string :category

      t.timestamps
    end
  end
end
