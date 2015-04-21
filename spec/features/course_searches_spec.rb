require 'rails_helper'
require 'tempfile'

feature "CourseSearches", :type => :feature do
  scenario "User searches from the Course page" do
    sign_in
    
    2.times do |t|
      course = Course.new(name:"Test#{t}")
      tempfile = Tempfile.new(['temp', ".mp4"])
      tempfile.write(Kernel.rand)
      tempfile.flush
      tempfile.rewind
      course.file_attachments.build(file:tempfile)
      course.save!
    end

    visit "/courses"
    fill_in "course[query]", with: "1"
    click_button "Submit"
    expect(page).not_to have_text("Test2")
  end
end
