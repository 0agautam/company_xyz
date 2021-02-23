class AddDetailsToDepartments < ActiveRecord::Migration[6.1]
  def change
    add_column :departments, :floor, :integer
    add_column :departments, :head, :string
  end
end
