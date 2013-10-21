require "test_helper"

feature "visitor visit index page of blog" do
  scenario "visitor navigates to blog" do
    # navigate to main index of blog
    visit posts_path

    # Checks to see if
    page.text.must_include 'Listing posts'
    page.text.must_include 'Code Fellows'
    page.text.must_include 'I love cats and dogs'
    page.text.wont_include 'Dr Seuss'

  end
end
