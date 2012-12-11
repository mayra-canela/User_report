class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string  :firstname
      t.string  :lastname
      t.integer :rate, default: 25
      t.integer :hours_week
      t.integer :worked_hours

      t.timestamps
    end
  end
end
