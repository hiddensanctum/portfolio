require "test_helper"

feature "Auth::SignUp" do
  scenario "Sign up works fine" do
    # Sign in
    sign_in

    # Should be signed in
    page.text.must_include "Signed in successfully"
    page.text.wont_include "Sign In"

  end
end
