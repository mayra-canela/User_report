require 'spec_helper'

describe "Users" do
  context "GET /users" do
    it "displays users" do
      Employee.create!(:firstname => "Antonio", :lastname => "Chavez", :account_number => 1232344548765435, :hours_week => 40)
      visit root_path
      page.should have_content("Antonio Chavez")
    end

    it "supports js", :js => true do
      visit root_path
      click_link "test js"
      page.should have_content("js works")
    end
  end

  context "POST /users" do
    it "create employee" do
      visit new_employee_path
      fill_in "Firstname", :with => "Mayra"
      fill_in "Lastname", :with => "Canela"
      fill_in "Account number", :with => 1234567391231234
      click_button "Create Employee"
      # save_and_open_page
      page.should have_content("Employee was successfully created.")
      page.should have_content("Mayra")
    end
  end

end
