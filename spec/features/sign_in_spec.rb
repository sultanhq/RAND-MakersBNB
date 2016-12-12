require 'spec_helper'

feature 'Sign In' do

  scenario("shows the user the sign in page") do
    visit '/sessions/new'
    fill_in "email", with: "James@dix.com"
    fill_in "password", with: "james123"
    click_button("Sign in")

    expect(current_path).to eq '/dashboard'
    expect(page).to have_content 'Welcome James@dix.com'
  end

end
