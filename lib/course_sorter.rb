class CourseSorter
  attr_reader :course

  def initialize(course)
    @course = course
  end

  def sort
    course.file_attachments.to_a.sort_by do |file_attachment|
      unless file_attachment.file_basename.nil?
        file_to_match = file_attachment.file_basename.gsub(/\..{3}$/, '')
        file_to_match.scan(/\d+/).collect(&:to_i)
      end
    end
  end
end
