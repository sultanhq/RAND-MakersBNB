module SessionHelpers

  def sign_up
    visit '/'
    fill_in "name", with: "James Dix"
    fill_in "email", with: "James@dix.com"
    fill_in "password", with: "james123"
    click_button("Sign up")
  end

  def sign_in
    visit '/sessions/new'
    fill_in "email", with: "James@dix.com"
    fill_in "password", with: "james123"
    click_button("Sign in")
  end

  def add_space
    click_button("Add space")
    fill_in "name", with: "Comfy room"
    fill_in "description", with: "The comfiest room evA"
    fill_in "price_per_night", with: "100"
    fill_in "available_from", with: "2016-12-12"
    fill_in "available_to", with: "2016-12-30"
    click_button("Save")
  end

  def add_space_dates_wrong
    click_button("Add space")
    fill_in "name", with: "Comfy room"
    fill_in "description", with: "The comfiest room evA"
    fill_in "price_per_night", with: "100"
    fill_in "available_from", with: "2016-12-30"
    fill_in "available_to", with: "2016-12-12"
    click_button("Save")
  end

  def add_space_no_name
    click_button("Add space")
    fill_in "description", with: "The comfiest room evA"
    fill_in "price_per_night", with: "100"
    fill_in "available_from", with: "2016-12-12"
    fill_in "available_to", with: "2016-12-30"
    click_button("Save")
  end

  def add_space_no_description
    click_button("Add space")
    fill_in "name", with: "Comfy room"
    fill_in "price_per_night", with: "100"
    fill_in "available_from", with: "2016-12-12"
    fill_in "available_to", with: "2016-12-30"
    click_button("Save")
  end

  def add_space_no_price
    click_button("Add space")
    fill_in "name", with: "Comfy room"
    fill_in "description", with: "The comfiest room evA"
    fill_in "available_from", with: "2016-12-12"
    fill_in "available_to", with: "2016-12-30"
    click_button("Save")
  end

  def update_space
    fill_in "name", with: "Comfy room"
    fill_in "description", with: "Even more comfy than evA"
    fill_in "price_per_night", with: "50"
    fill_in "available_from", with: "2016-12-12"
    fill_in "available_to", with: "2016-12-30"
    click_button("Update space")
  end

end
