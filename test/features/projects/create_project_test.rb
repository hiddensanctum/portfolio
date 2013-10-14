require 'test_helper'

  feature "Check create project is functioning properly" do
    scenario "adding a new project" do
      visit projects_path
      click_on "New project"
      fill_in 'Name', with: "Manhattan Project"
      fill_in 'Technologies used', with: "Now I am become Death, the destroyer of worlds"

      click_on "Create Project"

      page.text.must_include "Manhattan Project"
      page.text.must_include "Now I am become Death, the destroyer of worlds"
    end
  end
