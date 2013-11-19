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

      fill_in "Name", with: "My Rad Portfolio"
      fill_in "Technologies used", with: "Code Fellows Portfolio"
      click_on "Update Project"
      save_and_open_page

      # Then the changes should be saved and shown
      page.text.must_include "Rad Portfolio"
      save_and_open_page
      page.text.must_include "Code Fellows Portfolio"
    end
    scenario "incorrectly editing an existing project" do
      # Sign in as an editor
      #sign_in(:one)
      pending

      visit projects_path
      click_link("Edit", href: "/projects/298486374/edit")
      fill_in "Name", with: "Q"

      click_on "Update Project"

      page.text.must_include "Name is too short"
    end
  end
