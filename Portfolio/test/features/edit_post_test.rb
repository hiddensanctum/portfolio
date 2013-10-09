require "test_helper"

feature "editing a post" do
  scenario "makes a new post" do
    # Create a post
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

    # Given a edit post form
    click_on 'Edit'
    fill_in 'Title', with: 'Code Fellows Day 3'
    fill_in 'Body', with: 'Not a good day for rails'

    # When I submit the form
    click_on 'Update Post'

    # I should see the changes
    page.text.must_include 'Code Fellows Day 3'
    page.text.must_include 'Not a good day for rails'

    # Show successful change message
    page.text.must_include 'Post was successfully updated'
  end
end
