class AddEmpIdToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :emp_id, :string, first: true
  end
end
