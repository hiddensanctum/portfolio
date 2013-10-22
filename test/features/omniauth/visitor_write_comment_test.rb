require "test_helper"

feature "visitor adds a comment" do
  scenario "visitor adds valid comment" do

    # Visit post index page
    visit posts_path(posts(:published))
    fill_in :comment_author, with: "troll one"
    fill_in :comment_author_url, with: "http://trollsite.example.com"
    fill_in :comment_author_email, with: "troll@example.com"
    fill_in :comment_comment, with: "troll troll troll"
    click_on "Submit comment for approval"


    # Shows a success message
    page.text.wont_include 'Code Fellows'
    page.text.wont_include 'Its a good day for rails'

    # Tested Working on 10/9/13
  end
end
