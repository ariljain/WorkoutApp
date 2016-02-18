require 'rails_helper'

RSpec.feature "Sign up user" do

  scenario "User with proper email is able to sign up" do
    user_email = 'user@example.com'
    user_password = 'password'

    visit "/"

    click_link "Sign up"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Doe"
    fill_in "Email", with: user_email
    fill_in "Password", with: user_password
    fill_in "Password confirmation", with: user_password

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")

    visit "/"
    expect(page).to have_content("John Doe")
  end

end