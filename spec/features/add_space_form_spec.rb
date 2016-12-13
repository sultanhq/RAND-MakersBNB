require 'spec_helper'

feature 'Adding a space' do
  scenario 'User has signed up and adds a space to their listing' do
      sign_up
      click_button("Add space")
      expect(page.current_path).to eq('/space/new')
      expect(page).to have_content("Please add new space details")
    end

    scenario 'User has clicked button add space and fills in the form' do
      def add_space
      sign_up
      click_button("Add space")
      fill_in "Space name", with: "Comfy room"
      click_button("Save space")
      end
      expect{add_space}.to change(Space, :count).by(1)
      expect(page.current_path).to eq("/dashboard")
  end
end
