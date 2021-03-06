require "test_helper"

feature "Auth::SignUp" do
  scenario "Sign up works fine" do
    pending #users are not longer able to sign into my portfolio
    visit root_path

    # Click on registration form
    click_on "Sign Up"

    # Fill in information
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    # Should be signed in
     page.text.must_include "Welcome! You have signed up successfully"
     page.text.wont_include "There was a problem with your sign up"

  end
end
