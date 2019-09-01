class AddAcademicYearToClassGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :class_groups, :academic_year, :text
  end
end
