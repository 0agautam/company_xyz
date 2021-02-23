class AddEmployeeRefToDepartments < ActiveRecord::Migration[6.1]
  def change
    add_reference :departments, :employee, null: false, foreign_key: true
  end
end
