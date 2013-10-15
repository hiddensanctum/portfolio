require 'test_helper'
  feature "Check deleting a project is functioning properly" do
    scenario "deleting is functioning properly" do
      # visit index page
      visit projects_path

      # Click on destroy button
      click_link("Destroy", href: "/projects/#{projects(:two).id}")

      # page must display that project was successfully deleted
      page.text.must_include "Project was successfully deleted"

      # page must not have deleted info
      page.text.wont_include "World Domination"
      page.text.wont_include "Cats"
    end
  end
