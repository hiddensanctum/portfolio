require "test_helper"

feature "Visit Index Page of Blog" do
  scenario "navigate to Blog" do
    #navigate to main index of blog
    visit post_path

    #Checks to see if
    page.text.must_include 'Listing Index'
  end
end





