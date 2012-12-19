class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string  :firstname
      t.string  :lastname
      t.string  :account_number
      t.integer :rate, default: 25
      t.integer :hours_week, default: 0
      t.integer :worked_hours, default:0

      t.timestamps
    end
  end
end
