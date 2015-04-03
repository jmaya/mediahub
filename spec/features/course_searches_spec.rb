require 'rails_helper'

feature "CourseSearches", :type => :feature do
  xscenario "User searches from the Course page" do
    sign_in

    2.times do |t|
      course = Course.new(name:"Test#{t}")
      course.file_attachments.build(file:File.open(Rails.root.to_s + "/spec/fixtures/test.mp4"))
      course.save!
    end

    visit "/courses"
    fill_in "course[query]", with: "1"
    button_click "Submit"
    expect(page).not_to have_text("Test2")
  end
end
