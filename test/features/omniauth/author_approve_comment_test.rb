require "test_helper"

feature "Approves a comment" do
  scenario "editor approved a comment" do
    sign_in(:one)

    visit post_path(posts(:one))

    fill_in :comment_author, with: "troll one"
    fill_in :comment_author_url, with: "http://trollsite.example.com"
    fill_in :comment_author_email, with: "troll@example.com"
    fill_in :comment_content, with: "troll troll troll"

    click_on "Submit comment for approval"

    click_on "Approve"

    page.text.must_include "Disapprove"
    page.text.must_include "comment was successfully updated."
    page.text.wont_include "Approve"
  end
  scenario "author approved a comment" do
    sign_in(:two)

    visit post_path(posts(:one))

    fill_in :comment_author, with: "troll one"
    fill_in :comment_author_url, with: "http://trollsite.example.com"
    fill_in :comment_author_email, with: "troll@example.com"
    fill_in :comment_content, with: "troll troll troll"

    click_on "Submit comment for approval"

    click_on "Approve"

    page.text.must_include "Disapprove"
    page.text.must_include "comment was successfully updated."
    page.text.wont_include "Approve"
  end
end
