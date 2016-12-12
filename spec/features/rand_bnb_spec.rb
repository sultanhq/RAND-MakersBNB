require 'spec_helper'

feature 'Sign up page' do
  scenario 'should show sign up form' do
    visit '/'
    expect(page).to have_content("Please sign up!")
  end

  scenario "user can submit a sign up form" do
    visit '/'
    fill_in "name", with: "James Dix"
    fill_in "email", with: "James@dix.com"
    fill_in "password", with: "james123"
    click_button("Sign up")
    expect(page.current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome James@dix.com")
  end
end
