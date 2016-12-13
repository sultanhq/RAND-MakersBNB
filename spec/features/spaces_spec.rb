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
  
end
