require "test_helper"

feature "author editing a post" do
  scenario "author edit a post" do
    # Sign in as an author
    sign_in(:au)

    # Visit post index page
    visit posts_path

    # Edit should not be avaliable for the author
    page.text.must_include 'Edit'
  end
end
