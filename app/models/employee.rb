class Employee < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :account_number, :rate, :hours_week, :worked_hours

  validates_presence_of :firstname, :lastname, :account_number, :rate, :hours_week

  validates :account_number, format: { 
    with: /^?[0-9]{16}/,
    message: "The account name should be 16 digits, grouped by 4 and separated by '-'"}
end
