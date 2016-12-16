require 'spec_helper'

feature 'Sign In' do

  scenario("shows the user the sign in page") do
    sign_up
    expect{sign_in}.to change(User, :count).by(0)
    expect(current_path).to eq '/dashboard'
    expect(page).to have_content 'Welcome back to Rand-Bnb, James'
  end

  scenario("keeps the user on the sign in page if wrong credentials") do
    visit('/sessions/new')
    fill_in "email", with: 'james@dix.com'
    fill_in "password", with: 'wrongpassword'
    within ('form#sign_in') do
      click_button "Sign in"
    end
    expect(current_path).to eq '/sessions/new'
    expect(page).not_to have_content 'Welcome James Dix'
    expect(page).to have_content 'Wrong password'
  end

end
