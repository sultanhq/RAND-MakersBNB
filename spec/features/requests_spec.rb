require 'spec_helper'

feature 'Requests page' do
  scenario 'a user can see the requests they have made' do
    sign_up
    add_space
    make_request
    click_button("My requests")
    expect(page).to have_content("Request number: 1")
  end

  xscenario 'a user can see the booking id of requests they have received' do
    sign_up
    add_space
    sign_up2
    make_request
    click_button("Sign Out")
    sign_in
    click_button("My requests")
    expect(page).to have_content("Request number: 1")
  end

  scenario 'a user can see the booking date of requests they have received' do
    sign_up
    add_space
    sign_up2
    make_request
    click_button("Sign Out")
    sign_in
    click_button("My requests")
    expect(page).to have_content(Date.today)
  end

  scenario 'a user can see the space name of requests they have received' do
    sign_up
    add_space
    sign_up2
    make_request
    click_button("Sign Out")
    sign_in
    click_button("My requests")
    expect(page).to have_content("Comfy room")
  end

  scenario 'a user can see multiple requests they have received' do
    sign_up
    add_space
    add_space2
    save_and_open_page
    click_button("Sign Out")
    sign_up2
    make_request
    make_request2
    click_button("Sign Out")
    sign_in
    click_button("My requests")
    expect(page).to have_content("Comfy room")
    expect(page).to have_content("Slightly comfy room")
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
      expect(page).to have_content("You have unconfirmed bookings")
    end
end
