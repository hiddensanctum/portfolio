require 'test_helper'

feature "As the site owner, I want to edit a project so that I can correct typos" do
  scenario "editing an existing project", js: true do
      # Sign in as an editor
      sign_in(:ed)

      #visit projects_path
      visit projects_path

      #click_on "Edit"
      click_link("Edit", href: "/projects/729307280/edit")

      # When I make changes
      page.find('#project_name')

      fill_in("Name", with: "My Rad Portfolio")
      fill_in "Technologies used", with: "Code Fellows Portfolio"
      find_button('Update Project').click


      # Then the changes should be saved and shown
      page.text.must_include "Rad Portfolio"
      page.text.must_include "Code Fellows Portfolio"
    end
    scenario "incorrectly editing an existing project", js: true  do
      # Sign in as an editor
      sign_in(:ed)

      visit projects_path
      click_link("Edit", href: "/projects/729307280/edit")

      page.find('#project_name')
      fill_in "Name", with: "Q"

      click_on "Update Project"
      page.find('#project_name')
      page.text.wont_include "Q"
    end
  end
