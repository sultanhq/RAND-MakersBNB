require 'spec_helper'

feature 'Adding a space' do
  scenario 'User has signed up and adds a space to their listing' do
      sign_up
      click_button("Add space")
      expect(page.current_path).to eq('/space/new')
      expect(page).to have_content("Please add new space details")
    end

  scenario 'User has clicked button add space and fills in the form' do
    expect{add_space}.to change(Space, :count).by(1)
    expect(page.current_path).to eq("/dashboard")
  end

  scenario 'User has not filled in name' do
    expect{add_space_no_name}.to change(Space, :count).by(0)
    expect(page.current_path).to eq('/space/new')
    expect(page).to have_content("All fields must be completed")
  end

  scenario 'User has not filled in description' do
    expect{add_space_no_description}.to change(Space, :count).by(0)
    expect(page.current_path).to eq('/space/new')
    expect(page).to have_content("All fields must be completed")
  end

  scenario 'User has not filled in price' do
    expect{add_space_no_price}.to change(Space, :count).by(0)
    expect(page.current_path).to eq('/space/new')
    expect(page).to have_content("All fields must be completed")
  end

end
