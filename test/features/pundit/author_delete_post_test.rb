require "test_helper"

feature "author deleting a post" do
  scenario "author deletes the post" do
    # Sign in as an author
    sign_in(:two)

    # Visit post index page
    visit posts_path

    # destory link should not be avaliable for the author
    page.text.wont_include 'Destroy'

    # Tested Working on 10/9/13
  end
end
