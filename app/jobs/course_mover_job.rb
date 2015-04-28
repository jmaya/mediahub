class CourseMoverJob < ActiveJob::Base
  queue_as :default

  def perform(course_id,full_path,data)
    course = Course.find course_id
    upload = ActionDispatch::Http::UploadedFile.new({
      :filename => data["original_filename"],
      :content_type => data["content_type"],
      :tempfile => File.new(full_path)
    })
    fa = FileAttachment.new()
    fa.file = upload
    fa.course = course
    fa.save
    File.unlink(full_path)
  end
end
