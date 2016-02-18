require 'rails_helper'

RSpec.feature "Editing exercises" do

  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)

    @e1 = @john.exercises.create!(duration_in_min: 20, workout: "Cardio routine", workout_date: Date.today)
    @e2 = @john.exercises.create!(duration_in_min: 30, workout: "Shoulders routine", workout_date: Date.today)
  end

  scenario "with valid input succeeds" do
    visit "/"

    click_link "My Lounge"

    link = "a[href='/user/#{@john.id}/exercises/#{@e2.id}/edit']"
    find(link).click

    fill_in "Duration", with: 15
    click_button "Update Exercise"

    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content(15)
    expect(page).not_to have_content(30)

  end

end