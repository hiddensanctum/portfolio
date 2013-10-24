require "test_helper"

feature "author visit index page of blog" do
  scenario "author navigates to blog" do
    # sign in as editor
    sign_in(:two)
    # navigate to main index of blog
    visit posts_path

    # Checks to see if
    page.text.must_include 'Blog'
    page.text.must_include 'Code Fellows'
    page.text.must_include 'I love cats and dogs'
    page.text.must_include 'Green Eggs and Ham'

  end
end
