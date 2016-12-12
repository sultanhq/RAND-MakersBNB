require 'spec_helper'

feature 'Sign In' do

  scenario("shows the user the sign in page") do
    expect{sign_in}.to change(User, :count).by(0)
    expect(current_path).to eq '/dashboard'
    expect(page).to have_content 'Welcome James@dix.com'
  end

end
