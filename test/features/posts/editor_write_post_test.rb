require "test_helper"

feature "editor creating a post" do
 scenario "editor made a new post" do
  # Given an authorized user complets a new post form
  sign_in(:ed)

  # Given a completed post form
  visit new_post_path
  fill_in 'Title', with: 'Code Fellows'
  fill_in 'Body', with: 'Its a good day for rails'

  # When I submit the form
  click_on 'Create Post'

  # Then I should see the post
  page.text.must_include 'Code Fellows'
  page.text.must_include 'Its a good day for rails'

  # And a success message
  page.text.must_include 'Post was successfully created'

  # checks to see if there is an author
  page.has_css? "#author"
  page.text.must_include users(:ed).email
  end
end
