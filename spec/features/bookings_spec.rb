require 'spec_helper'

feature 'Bookings Page' do

  scenario 'Once request is approved, user can see bookings made' do
    sign_up
    add_space
    click_button("Sign Out")
    sign_up2
    make_request
    click_button("Sign Out")
    sign_in
    click_button("My requests")
    accept_request
    click_button("My bookings")
    expect(page).to have_content("Comfy room")
  end

  scenario 'Once request is approved, it can no longer be seen in requests' do
    sign_up
    add_space
    click_button("Sign Out")
    sign_up2
    make_request
    click_button("Sign Out")
    sign_in
    click_button("My requests")
    accept_request
    click_button("My requests")
    expect(page).not_to have_content("Comfy room")
  end

  scenario 'Once request is rejected, it can no longer be seen in requests' do
    sign_up
    add_space
    click_button("Sign Out")
    sign_up2
    make_request
    click_button("Sign Out")
    sign_in
    click_button("My requests")
    reject_request
    click_button("My requests")
    expect(page).not_to have_content("Comfy room")
  end

  scenario 'Once a request is rejected, it can no longer be seen in bookings' do
    sign_up
    add_space
    click_button("Sign Out")
    sign_up2
    make_request
    click_button("Sign Out")
    sign_in
    click_button("My requests")
    reject_request
    click_button("My bookings")
    expect(page).not_to have_content("Comfy room")
  end

  scenario 'Once a request is rejected, it is no longer in the database' do
    sign_up
    add_space
    click_button("Sign Out")
    sign_up2
    make_request
    click_button("Sign Out")
    sign_in
    click_button("My requests")
    expect{reject_request}.to change(Booking, :count).by(-1)
  end

  scenario "Host can see the Requesters Name in 'my bookings' page" do
    sign_up
    add_space
    sign_up2
    make_request
    click_button("Sign Out")
    sign_in
    click_button("My requests")
    accept_request
    click_button("My bookings")
    within ('ul#bookings_received') do
      expect(page).to have_content("Requesters name: Jenna")
    end
  end

  scenario "Requester can see the hosts name in 'my bookings' page" do
    sign_up
    add_space
    sign_up2
    make_request
    click_button("Sign Out")
    sign_in
    click_button("My requests")
    accept_request
    click_button("Sign Out")
    sign_in2
    click_button("My bookings")
    within ('ul#bookings_made') do
      expect(page).to have_content("Hosts name: James Dix")
    end
  end


end
