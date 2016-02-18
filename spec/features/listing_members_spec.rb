require 'rails_helper'

RSpec.feature "Listing Members" do

  before do
    @m1 = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @m2 = User.create(first_name: "Sarah", last_name: "Joe", email: "sarah@example.com", password: "password")
  end

  scenario "shows a list of registered members" do
    visit "/"
    
    expect(page).to have_content("List of Members")
    expect(page).to have_content(@m1.full_name)
    expect(page).to have_content(@m2.full_name)
  end

end