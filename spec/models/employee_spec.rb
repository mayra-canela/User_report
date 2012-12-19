require 'spec_helper'

describe Employee do
before(:each) { @employee = Employee.new(:firstname => "Antonio", :lastname => "Chavez", :account_number => 1232344545, :hours_week => 40) }

  context '#validations' do
    
   it  'Should not allow to create repeated values' do
      expect {Employee.account_number.new}.to raise_error
   end

  it 'should initialize rate with a value' do
      @employee.rate.should == 25
    end
  it 'has no hours week' do
    employee=Employee.new
    employee.hours_week.should == 0 
  end

  it 'has no worked hours' do
    employee=Employee.new
    employee.worked_hours.should == 0
  end
  end

context '#calculations' do
   
    it 'should have salary as calculated attribute' do
      @employee.worked_hours = 35
      @employee.salary.should == 875
    end
    
    it 'should calculate the total of salaries' do
      Employee.total_amount.should == Employee.all.map(&:salary).sum
    end

 end
end
