require 'spec_helper'

feature 'Sign up page' do
  scenario 'should show sign up form' do
    visit '/'
    expect(page).to have_content("Please sign up!")
  end
end
