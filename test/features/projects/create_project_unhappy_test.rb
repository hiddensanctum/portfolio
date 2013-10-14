require 'test_helper'

feature "Check if error message for invalid entry" do
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
