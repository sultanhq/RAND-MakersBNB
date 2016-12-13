require 'spec_helper'

feature 'dashboard shows spaces' do
  scenario 'user has signed up and is taken to viewing page' do
    sign_up
    expect(page.current_path).to eq("/dashboard")
    expect(page).to have_content("Spaces")
  end

  scenario 'update hosts space details' do
    sign_up
    add_space
    click_button("My spaces")
    page.find('li', :text => "1").click_button("Edit space")
      expect(current_path).to eq('/space/update')
      expect(page).to have_content("Please update your space")
  end
  scenario 'changes have been implemented' do
    sign_up
    add_space
    click_button("My spaces")
    page.find('li', :text => "1").click_button("Edit space")
    update_space
    expect(current_path).to eq("/space/host")
    expect(page).to have_content("Even more comfy than evA")
  end
end
