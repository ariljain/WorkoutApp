require 'rails_helper'

RSpec.feature "Listing exercises" do

  before do
    @john = User.create!(first_name: "John",
                         last_name: "Doe",
                         email: "john@example.com",
                         password: "password")
    login_as(@john)

    @e1 = @john.exercises.create(duration_in_min: 20, workout: "Legs routine", workout_date: "2016-02-15")
    @e2 = @john.exercises.create(duration_in_min: 20, workout: "Biceps routine", workout_date: "2016-02-17")
  end

  scenario "Show user's workout" do
    visit "/"

    click_link "My Lounge"

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)

    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)

  end



end