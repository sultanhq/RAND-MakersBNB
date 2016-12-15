require 'spec_helper'

feature 'dashboard shows spaces' do
  scenario 'user has signed up and is taken to viewing page' do
    sign_up
    expect(page.current_path).to eq("/dashboard")
    expect(page).to have_content("Spaces")
  end

  scenario 'update hosts space details' do
    sign_up
    add_space
    click_button("My spaces")
    page.find('li', :text => "1").click_button("Edit space")
      expect(current_path).to eq('/space/update')
      expect(page).to have_content("Please update your space")
  end

  scenario 'changes have been implemented' do
    sign_up
    add_space
    click_button("My spaces")
    page.find('li', :text => "1").click_button("Edit space")
    update_space
    expect(current_path).to eq("/space/host")
    expect(page).to have_content("Even more comfy than evA")
  end

  scenario "user views spaces, including name" do
    sign_up
    add_space
    expect(page).to have_content("Comfy room")
  end

  scenario "user views spaces, including description" do
    sign_up
    add_space
    expect(page).to have_content("The comfiest room evA")
  end

  scenario "user views spaces, including price per night" do
    sign_up
    add_space
    expect(page).to have_content("100")
  end

  scenario "user views spaces, including available from date" do
    sign_up
    add_space
    expect(page).to have_content("2016-12-12")
  end

  scenario "user views spaces, including available to date" do
    sign_up
    add_space
    expect(page).to have_content("2016-12-16")
  end

  scenario "user can filter by dates for an available date 2016-12-12" do
    sign_up
    add_space
    fill_in "search_availability", with: "2016-12-12"
    click_button "Search"
    expect(page).to have_content("Comfy room")
  end

  scenario "user can filter by dates for an unavailable date 2016-12-18" do
    sign_up
    add_space
    fill_in "search_availability", with: "2016-12-18"
    click_button "Search"
    expect(page).not_to have_content("Comfy room")
    expect(page).to have_content("Chosen date not available")
  end


  scenario "user can request to rent a space" do
    sign_up
    add_space
    click_button 'Sign Out'
    sign_up2
    visit('/dashboard')
    page.find('li', :text => "1").click_button("Request")
    expect(page).to have_content("Request sent to space owner")
    expect(page.current_path).to eq('/dashboard')
  end

  scenario "filter defaults to today" do
    sign_up
    add_space
    add_space_not_today
    visit '/dashboard'
    click_button "Search"
    expect(page).not_to have_text("Jenna's room")
  end

end
