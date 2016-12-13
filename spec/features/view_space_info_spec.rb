require 'spec_helper'

feature 'Viewing spaces' do
  scenario 'User can see the newly added space name' do
    sign_up
    add_space
    click_button('My spaces')
    expect(current_path).to eq '/space/host'
    expect(page).to have_content("Comfy room")
    expect(page).to have_content("The comfiest room evA")
    expect(page).to have_content("100")
  end
end
