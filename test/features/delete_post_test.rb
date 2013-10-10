require "test_helper"

feature "deleting a post" do
  scenario "delete the post" do
    # Visit post index page
    visit posts_path
    # Click on destroy
    click_on 'Destroy'

    # Shows a success message
    page.text.wont_include 'Code Fellows'
    page.text.wont_include 'Its a good day for rails'

    # Tested Working on 10/9/13
  end
end
