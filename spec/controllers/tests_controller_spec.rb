require 'spec_helper'

describe EmployeesController do
  
    it 'Should not allow to create blank objects' do
      expect { Employee.create! }.to raise_error
    end

    it "is successful" do
        response.should be_success
      end

      end

