require "test_helper"

feature "editor deleting a post" do
  scenario "editor delete the post" do
    # Sign in as an editor
    sign_in(:one)

    # Visit post index page
    visit posts_path

    # Click on destroy
    click_link("Destroy", href: "/posts/#{posts(:one).id}")

    # Shows a success message
    page.text.wont_include 'Code Fellows'
    page.text.wont_include 'Its a good day for rails'

    # Tested Working on 10/9/13
  end
end
