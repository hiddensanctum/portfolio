require "test_helper"

feature "editor publish a post" do
  scenario "editor publishes a post" do
    # sign in as editor
    sign_in(:one)
    # navigate to main index of blog
    visit posts_path

    # Page must have the unpublished post
    page.text.must_include 'Dr Seuss'
    page.text.must_include 'Publish'

    # Click on publish button
    click_link("Publish")

    # Click on Sign out
    click_on "Sign Out"

    # navigate to main index of blog
    visit posts_path

    # Check to see if post is published
    page.text.must_include 'Dr Seuss'
    page.text.wont_include 'Publish'
  end
end
