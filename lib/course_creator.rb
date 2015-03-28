class CourseCreator
  attr_reader :original_path, :course_name
  def initialize path
    @original_path = path
    @course_name = File.basename(path)
  end

  def self.from_path(path)
    self.new path
  end

end
