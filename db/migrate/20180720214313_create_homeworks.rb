class CreateHomeworks < ActiveRecord::Migration[5.2]
  def change
    create_table :homeworks do |t|
      t.integer :class_group_id
      t.date :date
      t.text :title

      t.timestamps
    end
  end
end
