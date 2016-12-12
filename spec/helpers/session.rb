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

end
