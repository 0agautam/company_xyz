class RenameColumnClassOfStudents < ActiveRecord::Migration[6.1]
  def change
  	rename_column :students, :class, :roll_no
  end
end
