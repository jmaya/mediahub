class CourseSorter
  attr_reader :course

  def initialize course
    @course = course
  end

  def sort
    course.file_attachments.sort_by do |file_attachment|
      file_attachment.file.path.scan(/\d+/).join.to_i
    end
  end

end
