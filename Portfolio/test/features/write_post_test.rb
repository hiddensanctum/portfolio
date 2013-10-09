require "test_helper"

feature "creating a post" do
 scenario "works with valid data" do

  # Given a completed post form
  visit posts_path
  click_on 'New Post'
  fill_in 'Title', with: 'Code Fellows'
  fill_in 'Body', with: 'Its a good day for rails'

  # When I submit the form
  click_on 'Create Post'

  # Then I should see the post
  page.text.must_include 'Code Fellows'
  page.text.must_include 'Its a good day for rails'

  # And a success message

  page.text.must_include 'Post was successfully created'

  end
end
