class Employee < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :account_number, :rate, :hours_week, :worked_hours

  validates_presence_of :firstname, :lastname, :account_number, :rate, :hours_week

  validates_uniqueness_of :account_number

  validates :account_number, format: { 
    with: /^?[0-9]{16}/,
    message: "The account number should be 16 digits, letters and symbols not required"
  }

  def salary
    self.worked_hours * self.rate
  end

  def self.total_amount
    Employee.all.map(&:salary).sum
  end

  def self.csv_report
    string_report = CSV.generate do |row|
      row << ["ID", "Fullname",	"Account number",	"Rate",	"Hours week",	"hours worked",	"Salary"]
      Employee.all.each do |employee|
        row << [employee.id, "#{employee.firstname} #{employee.lastname}", employee.account_number, employee.rate, employee.hours_week, employee.worked_hours, employee.salary]
      end
      row << [" "," "," "," "," ","Total: ", Employee.total_amount]
    end
    string_report
  end
end
