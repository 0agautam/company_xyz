class RemoveDepartmentFromEmployees < ActiveRecord::Migration[6.1]
  def change
    remove_column :employees, :department, :string
  end
end
