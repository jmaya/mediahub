require 'rails_helper'

feature "CourseSearches", :type => :feature do
  scenario "User searches from the Course page" do
    sign_in
    visit "/courses"
    save_and_open_page
  end
end
