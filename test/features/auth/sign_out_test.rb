require "test_helper"

feature "Auth::SignOut" do
  scenario "Sign out works fine" do
    # makes sure user is signed in
    sign_in(:ed)

    # Click on sign out
    click_on "Sign Out"

    # Should be signed out
     page.text.wont_include "Logged in as"

  end
end
