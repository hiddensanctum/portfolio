require "test_helper"

feature "Check theme is running" do
  scenario "theme has loaded successfully" do
    visit root_path
    page.body.must_include 'assets/application.css'
    page.body.must_include '/assets/application.js'
  end
end
