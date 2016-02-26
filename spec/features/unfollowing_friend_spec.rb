require 'rails_helper'

RSpec.feature "Unfollowing Friend" do

   before do
     @john = User.create(first_name: "John",
                        last_name: "Smith",
                        email: "john@example.com",
                        password: "password")

     @sarah = User.create(first_name: "Sarah",
                         last_name: "Doe",
                         email: "sarah@example.com",
                         password: "password")

    @e1 = @john.exercises.create(duration_in_min: 74, workout: "Weight lifting routine",
    workout_date: Date.today)

    @e2 = @sarah.exercises.create(duration_in_min: 55, workout: "Sarahs weight lifting routine",
    workout_date: Date.today)

    login_as(@john)
    @following = Friendship.create(user: @john, friend: @sarah)

   end

    scenario do
      visit "/"

      click_link "My Lounge"
      link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
      find(link).click

      expect(page).to have_content(@sarah.full_name + " unfollowed")
    end

end