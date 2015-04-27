require 'spec_helper'

require 'course_sorter'

describe CourseSorter do
  #TODO: Finish these specs
  context "with multiple items with dots..." do
    let(:course) { double("Course") }
    let(:cs) { CourseSorter.new(course) }

    it 'should start with a list of courses' do
      expect(cs.course).to eql(course)
    end

    context "sorts multiple attachments that have numbers in the start of name" do
      it 'sorts by the first' do
        fas = [
          double("FileAttachment", file:'/sadfasfsad/002.Getting-Started.mp3'),
          double("FileAttachment", file:'/sadfasfsad/001.Getting-Started.mp3')
        ]
        allow(course).to receive(:file_attachments).and_return(fas)
        expect(cs.sort[0]).to eql fas.last

      end
    end


  end

end
