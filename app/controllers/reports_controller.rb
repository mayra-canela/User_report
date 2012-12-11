class ReportsController < ApplicationController
  def index
    @employees = Employee.all
    @total_amount = Employee.total_amount
  end
end
