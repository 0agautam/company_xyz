class AddColumnStudentIdToKlasses < ActiveRecord::Migration[6.1]
  def change
    add_column :klasses, :student_id, :integer
  end
end
