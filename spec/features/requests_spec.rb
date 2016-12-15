require 'spec_helper'

feature 'Requests page' do
  scenario 'a user can see there current requests' do
    sign_up
    add_space
    make_request
    click_button("My requests")
    expect(page).to have_content("Request number: 1")
  end


end

  feature 'Requests' do


    scenario 'Bookings table increase by one when a request is made' do
      sign_up
      add_space
      visit'/dashboard'
      expect{make_request}.to change(Booking, :count).by(1)
    end

    scenario "filter keeps date user has searched for after search is complete" do
      sign_up
      add_space
      fill_in "search_availability", with: "2016-12-18"
      click_button "Search"
      click_button "Search"
      expect(page).not_to have_content("Comfy room")
    end

    scenario "Page flashes message when they have outstanding requests" do
      sign_up
      add_space
      make_request
      visit '/dashboard'
      require'pry';binding.pry
      expect(page).to have_content("You have unconfirmed bookings")
    end
end
