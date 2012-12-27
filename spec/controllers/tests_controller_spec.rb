require 'spec_helper'

describe EmployeesController do

  before(:each) { @employee = Employee.new(:firstname => "Antonio", :lastname => "Chavez", :account_number => 1232344548765435, :hours_week => 40) }

  it "is successful" do
    response.should be_success
  end

  it "should display a record in a table" do
    @employee.save
    visit root_path
    page.should have_content "Antonio"
  end

end

