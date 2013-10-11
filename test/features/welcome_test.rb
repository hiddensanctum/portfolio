require "test_helper"

feature "A local web page" do
  scenario "has a welcome headline" do
    visit "http://localhost:3000/"
    page.text.must_include "Portfolio"
  end
end
