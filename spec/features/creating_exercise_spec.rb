require 'rails_helper'

RSpec.feature "Creating Exercise" do

  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario "with valid inputs" do
    visit "/"

    click_link "My Lounge"
    click_link "New Workout"

    expect(page).to have_link("Back")

    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Weight Lifting"
    fill_in "Activity date", with: Date.current

    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")

    ex = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@john, ex))
  end

  scenario "with invalid inputs" do
    visit "/"

    click_link "My Lounge"
    click_link "New Workout"

    expect(page).to have_link("Back")

    fill_in "Duration", with: nil
    fill_in "Workout Details", with: ""
    fill_in "Activity date", with: nil

    click_button "Create Exercise"

    expect(page).to have_content("Exercise has not been created")
    expect(page).to have_content("Duration in min can't be blank")
    expect(page).to have_content("Duration in min is not a number")
    expect(page).to have_content("Workout can't be blank")
    expect(page).to have_content("Workout date can't be blank")

  end

end