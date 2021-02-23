class ChangeGenderTypeToString < ActiveRecord::Migration[6.1]

  def up
  	change_table :employees do |e|
  		e.change :gender, :text
  	end
  end

  def down
  	change_table :employees do |e|
  		e.change :gender, :string
  	end
  end

end
