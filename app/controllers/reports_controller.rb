class ReportsController < ApplicationController
  def index
    @employees = Employee.all
    @total_amount = Employee.total_amount
    respond_to do |format|
      format.html
      format.csv { render text: Employee.csv_report }
    end
  end
end
