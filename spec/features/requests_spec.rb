require 'spec_helper'

feature 'Requests page' do
  



  xscenario 'a user can see there current requests' do

    expect(page).to have_content("Request #1")
  end
end
