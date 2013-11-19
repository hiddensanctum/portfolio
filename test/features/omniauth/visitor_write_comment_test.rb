require "test_helper"

feature "visitor adds a comment" do
  scenario "visitor adds valid comment" do

    # Visit post index page
    visit post_path(posts(:one))
    fill_in :comment_author, with: "troll one"
    fill_in :comment_author_url, with: "http://trollsite.example.com"
    fill_in :comment_author_email, with: "troll@example.com"
    fill_in :comment_content, with: "troll troll troll"
    click_on "Submit comment for approval"

    page.text.must_include "comment waiting for moderation"

  end
  scenario "visitor adds invalid comment" do
    visit post_path(posts(:one))
    fill_in :comment_author, with: "troll one"
    fill_in :comment_author_url, with: "http://trollsite.example.com"
    fill_in :comment_content, with: "troll troll troll"
    click_on "Submit comment for approval"

    page.text.must_include "prohibited this comment from being saved"

  end
end
