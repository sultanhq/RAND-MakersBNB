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

  scenario "should not allow the same email address to be signed up twice" do
    sign_up
    expect{sign_up}.to change(User, :count).by(0)
  end

end
