require 'test_helper'
  feature "Check main page of a single project is functioning properly" do
    scenario "project page is loading properly" do
      # visit project page
      visit projects_path(projects(:cf))

      # Check to see if the name is correct
      page.text.must_include "Code Fellows Portfolio"
      page.text.must_include "Ruby on Rails"
    end
  end
