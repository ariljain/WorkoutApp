require 'rails_helper'

RSpec.feature "Searching for user" do

  before do
    @m1 = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @m2 = User.create(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password")
  end

  scenario "with existing name return all those users" do
    visit "/"

    fill_in "search_name", with: "Doe"
    click_button "Search"

    expect(page).to have_content(@m1.full_name)
    expect(page).to have_content(@m2.full_name)

    expect(current_path).to eq('/dashboard/search')
  end

end