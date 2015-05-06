class CourseSorter
  attr_reader :course

  def initialize course
    @course = course
  end

  def sort
    course.file_attachments.sort_by do |file_attachment|
      return 0 if file_attachment.file_basename.nil?
      file_attachment.file_basename.scan(/\d+/).join.to_i
    end
  end
end
