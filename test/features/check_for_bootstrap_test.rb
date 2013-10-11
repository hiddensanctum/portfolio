require "test_helper"

feature "Check Bootstrap is Running" do
  scenario "Bootstrap is running" do
    visit "http://localhost:3000/"
    page.body.must_include 'col-'
  end
end
