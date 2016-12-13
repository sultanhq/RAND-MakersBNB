require 'spec_helper'

feature 'dashboard shows spaces' do
  scenario 'user has signed up and is taken to viewing page' do
    sign_up
    expect(page.current_path).to eq("/dashboard")
    expect(page).to have_content("Spaces")
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

end
