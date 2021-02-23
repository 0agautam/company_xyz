class CreateDepartment < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name, :null => false
      t.string :technology, :null =>false

      t.timestamps
    end
  end
end
