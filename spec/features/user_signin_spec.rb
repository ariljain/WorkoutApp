require 'rails_helper'

RSpec.feature "Sign in user" do

  before do
    user_email = 'user@example.com'
    user_password = 'password'
    user_f_name = "John"
    user_l_name = "Doe"

    @john = User.create!(first_name: "John",
                         last_name: "Doe",
                         email: "john@example.com",
                         password: "password")
  end

  scenario "User with valid credentials is able to sign in" do
    visit "/"

    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("Signed in as #{@john.email}")
  end
  
  scenario "User with valid credentials is able to sign in" do
    visit "/"

    click_link "Sign in"
    fill_in "Email", with: 'random@domain.com'
    fill_in "Password", with: 'not_a_password'

    click_button "Log in"

    expect(page).to have_content("Invalid email or password.")
    expect(current_path).to eq(new_user_session_path)
  end

end