require 'test_helper'

feature "Check create project is functioning properly" do
  scenario "adding a new project" do
    # visit create new project page
    visit new_project_path

    # fill in new project info
    fill_in 'Name', with: "Manhattan Project"
    fill_in 'Technologies used', with: "Nuclear"

    # click on create new projct
    click_on "Create Project"

    # make sure project info displays correctly
    page.text.must_include "Project has been created"
    page.text.must_include "Manhattan Project"
    page.text.must_include "Nuclear"
  end
  scenario "new project has invalid data" do
    # visit create new project page
    visit new_project_path

    # fill in invalid data
    fill_in "Name", with: "Q"

    # click on create project
    click_on "Create Project"

    # check to make sure project was not created
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"

  end
end
