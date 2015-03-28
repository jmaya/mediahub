require 'spec_helper'
require 'course_creator'

describe CourseCreator do
  let(:cc) {
    CourseCreator.from_path(File.join("/a/fake/path","Pluralsight AngularUI"))
  }

  it 'should read take the name of the folder' do
    expect(cc.course_name).to eql("Pluralsight AngularUI")
  end
  
end
