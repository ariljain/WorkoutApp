require 'rails_helper'

RSpec.feature "Deleting exercise" do

  before do
    @owner = User.create(first_name: "John", last_name: "Doe", email: "owner@example.com", password: "password")

    @owner_exer = @owner.exercises.create!(duration_in_min: 48, workout: "Cardio special", workout_date: Date.today)

    login_as(@owner)
  end

  scenario do
    visit "/"
    click_link "My Lounge"
    link = "//a[contains(@href, '/user/#{@owner.id}/exercises/#{@owner_exer.id}') and .//text()='Delete']"
    find(:xpath, link).click

    expect(page).to have_content("Exercise has been deleted")
  end

end