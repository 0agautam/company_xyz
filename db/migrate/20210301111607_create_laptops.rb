class CreateLaptops < ActiveRecord::Migration[6.1]
  def change
    create_table :laptops do |t|
      t.string :device_id
      t.string :name
      t.integer :employee_id

      t.timestamps
    end
  end
end
