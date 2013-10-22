require "test_helper"

feature "author approves a comment" do
  scenario "author approved a comment" do
    #
    visit post_path(posts(:one))


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

    # Tested Working on 10/9/13
  end
end
