class CreateClassGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :class_groups do |t|
      t.text :name
      t.integer :year
      t.integer :number_in_class

      t.timestamps
    end
  end
end
