class EmployeesController < ApplicationController

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(params[:employee])
    respond_to do |format|
      if @employee.save
        format.html { redirect_to root_path, notice: 'Employee was successfully created.' }                                                                   
        format.json { render json: @employee, status: :created, location: @employee }
      else
        format.html { render action: "new" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end
  
  def update
    @employee = Employee.find(params[:id])
    respond_to do |format|
      if @employee.update_attributes(params[:employee])
        format.html { redirect_to root_path, notice: 'Employee was successfully updated.' }                                                                   
        format.json { render json: @employee, status: :created, location: @employee }
      else
        flash[:alert]="Ups something went wrong"
        format.html { render action: "edit" }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end
end
