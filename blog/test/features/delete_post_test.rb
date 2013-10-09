require "test_helper"

feature "deleting a post" do
  scenario "creating a post" do
    # Create a post
    visit post_path
    click_on 'New Post'
    fill_in 'Title', with: 'Code Fellows'
    fill_in 'Content', with: 'Its a good day for rails'

    # When I submit the form
    click_on 'Create Post'

    # Then I should see the post
    page.text.must_include 'Code Fellows'
    page.text.must_include 'Its a good day for rails'

    # And a success message
    page.text.must_include 'Post was successfully created'

    scenario 'deleting a post' do
      # Click on destroy
      click_on 'Destroy'

      # Prompt "are you sure?"
      click_on 'Yes'

      # Shows a success message
      page.text.must_include 'Post was successfully deleted'
    end
  end
end
