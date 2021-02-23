class AddDetailsToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :department, :string
    add_column :employees, :doj, :date
  end
end
