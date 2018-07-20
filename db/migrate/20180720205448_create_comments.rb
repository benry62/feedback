class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :student_id
      t.date :date
      t.text :title
      t.string :grade
      t.text :www
      t.text :area_for_development
      t.text :dirt
      t.text :spelling

      t.timestamps
    end
  end
end
