require 'test_helper'

  feature "Check create project is functioning properly" do
    scenario "adding a new project" do
      visit projects_path
      click_on "New project"
      fill_in 'Name', with: "Manhattan Project"
      fill_in 'Technologies used', with: "Nuclear"

      click_on "Create Project"

      page.text.must_include "Manhattan Project"
      page.text.must_include "Nuclear"
    end
  scenario "new project has invalid data" do
    visit new_project_path
    fill_in "Name", with: "Q"

    click_on "Create Project"

    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"

  end
end
