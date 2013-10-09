require "test_helper"

feature "Visit Index Page of Blog" do
  scenario "navigate to Blog" do
    #navigate to main index of blog
    visit posts_path

    #Checks to see if
    page.text.must_include 'Listing posts'
  end
end





