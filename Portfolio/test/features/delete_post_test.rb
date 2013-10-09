require "test_helper"

feature "deleting a post" do
  scenario "creating a post" do
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

    # Go back to index
    click_on 'Back'

    # Click on destroy
    click_on 'Destroy'

    # Shows a success message
    page.text.wont_include 'Code Fellows'
    page.text.wont_include 'Its a good day for rails'

    # Tested Working on 10/9/13
  end
end
