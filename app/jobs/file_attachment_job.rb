class FileAttachmentJob < ActiveJob::Base
  queue_as :default

  def perform(course_id, file_path)
    course = Course.find course_id
    fa = course.file_attachments.build
    File.open(file_path) do |f|
      fa.file = f
    end
    fa.save!
  end
end
