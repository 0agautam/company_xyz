class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :device_id
      t.string :name

      t.timestamps
    end
  end
end
