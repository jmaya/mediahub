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
          double("FileAttachment", file_basename:'002.Getting-Started.mp3'),
          double("FileAttachment", file_basename:'001.Getting-Started.mp3')
        ]
        allow(course).to receive(:file_attachments).and_return(fas)
        expect(cs.sort[0]).to eql fas.last
      end
      it 'sorts by the first with 0 in the name' do
        fas = [
          double("301_Safe_Proxy_Part_2.mp4", file_basename:'301_Safe_Proxy_Part_2.mp4'),
          double("300_Safe_Proxy_Part_1.mp4", file_basename:'300_Safe_Proxy_Part_1.mp4'),
          double("091_Ruby_2.0__Rebinding_Methods.mp4", file_basename:'091_Ruby_2.0__Rebinding_Methods.mp4')
        ]
        allow(course).to receive(:file_attachments).and_return(fas)
        expect(cs.sort[0]).to eql fas[-1]
      end
    end
  end

end
