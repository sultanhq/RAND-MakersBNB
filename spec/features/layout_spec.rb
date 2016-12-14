require 'spec_helper'

feature 'Sign Out' do
  scenario 'User can sign out of session' do
    sign_up
    click_button("Sign Out")
    expect(page.current_path).to eq('/sessions/new')
    expect(page).to have_content("Thank you for using RAND-bnb, see you again soon!")
  end
end
