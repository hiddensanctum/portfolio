require "test_helper"

feature "author creating a post" do
 scenario "author creates a new post" do
  # Sign in as an author
  sign_in(:two)

  # Given a completed post form
  visit new_post_path
  fill_in 'Title', with: 'Author Rocks'
  fill_in 'Body', with: 'I am awesome'

  # When I submit the form
  click_on 'Create Post'

  # Author should be able to see own post
  page.text.must_include 'Author Rocks'
  page.text.must_include 'I am awesome'

  # And a success message
  page.text.must_include 'Post was successfully created'
  end
end
