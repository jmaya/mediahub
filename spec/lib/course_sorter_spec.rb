require 'spec_helper'

require 'course_sorter'

describe CourseSorter do
  #TODO: Finish these specs
  context "with multiple items with dots..." do
    let(:list) {
      %w[
      2.1_The_BDD_and_TDD_Cycle.mp4
      2.10_Review.mp4
      2.11_Assignment.mp4
      2.2_The_First_Cucumber_Feature.mp4].collect do |n|
        double(name:n)
      end
    }
    let(:cs) { CourseSorter.new(list) }

    it 'should start with a list of courses' do
      expect(cs.list).to eql(list)
    end

    xit 'should sort the list with dots...' do
      expect(cs.sort.first.name).to eql("2.1_The_BDD_and_TDD_Cycle.mp4")
    end

  end

end
