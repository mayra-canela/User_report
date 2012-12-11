class Employee < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :account_number, :rate, :hours_week, :worked_hours

  validates_presence_of :firstname, :lastname, :account_number, :rate, :hours_week

  validates_uniqueness_of :account_number

  validates :account_number, format: { 
    with: /^?[0-9]{16}/,
    message: "The account number should be 16 digits, letters and symbols not required"
  }
end
