require 'spec_helper'

feature 'dashboard shows spaces' do
  scenario 'user has signed up and is taken to viewing page' do
    sign_up
    expect(page.current_path).to eq("/dashboard")
    expect(page).to have_content("Spaces")
  end
end
