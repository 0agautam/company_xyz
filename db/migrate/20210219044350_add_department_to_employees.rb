class AddDepartmentToEmployees < ActiveRecord::Migration[6.1]
  def change
  	add_column :employees, :department, :string
  	add_index :employees, :department
  end
end
