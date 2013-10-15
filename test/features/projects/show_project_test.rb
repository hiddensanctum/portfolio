require 'test_helper'
  feature "Check index page of project is functioning properly" do
    scenario "index page is loading properly" do
      # visit index page
      visit projects_path

      # Check to see if the name and technology used is there
      page.text.must_include "Code Fellows Portfolio"

    end
  end
