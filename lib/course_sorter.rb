class CourseSorter
  attr_reader :course

  def initialize course
    @course = course
  end

  def sort
    course.file_attachments.to_a.sort_by do |file_attachment|
      file_attachment.file_basename.scan(/\d+/).join.to_i unless file_attachment.file_basename.nil?
    end
  end
end
