class AddHeadingToPresentationItems < ActiveRecord::Migration[5.2]
  def change
    add_column :presentation_items, :heading, :text
  end
end
