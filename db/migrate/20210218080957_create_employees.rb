class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
    	t.text :name
    	t.text :gender
    	t.date :dob 
    	t.text :address

      	t.timestamps
    end
  end
end
