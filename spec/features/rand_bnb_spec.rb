require 'spec_helper'

feature 'Sign up page' do
  scenario 'should show sign up form' do
    visit '/'
    expect(page).to have_content("Please sign up!")
  end

  scenario "user can submit a sign up form" do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page.current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome James@dix.com")
  end

end
