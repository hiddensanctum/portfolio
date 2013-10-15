require 'test_helper'

feature "As the site owner, I want to edit a project so that I can correct typos" do
  scenario "editing an existing project" do
      # Given an existing project

      visit edit_project_path(projects(:one))
      #visit projects_path
      #click_on "Edit"

      # When I make changes
      fill_in "Name", with: "My Rad Portfolio"
      fill_in "Technologies used", with: "Code Fellows Portfolio"
      click_on "Update Project"

      # Then the changes should be saved and shown
      page.text.must_include "success"
      page.text.must_include "Rad Portfolio"
      page.text.must_include "Code Fellows Portfolio"
    end
    scenario "incorrectly editing an existing project" do

      visit edit_project_path(projects(:one))
      fill_in "Name", with: "Q"

      click_on "Update Project"

      page.text.must_include "Name is too short"
    end
  end