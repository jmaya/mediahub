require 'rails_helper'

feature "CourseSearches", :type => :feature do
  scenario "User searches from the Course page" do
    sign_in
    
    2.times do |t|
      course = Course.new(name:"Test#{t}")
      course.file_attachments.build(file:File.open(Rails.root.to_s + "/spec/fixtures/test.mp4"))
      course.save!
    end

    visit "/courses"

  end
end
