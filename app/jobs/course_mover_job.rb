require 'tempfile'

class CourseMoverJob < ActiveJob::Base
  queue_as :default

  def perform(course_id, full_path, data)
    course = Course.find course_id
    tempfile = Tempfile.new(File.basename(full_path))
    File.new(full_path, 'rb') do |fh|
      tempfile.write(fh.read)
    end
    upload = ActionDispatch::Http::UploadedFile.new({
                                                        :filename => data["original_filename"],
                                                        :content_type => data["content_type"],
                                                        :tempfile => tempfile
                                                    })
    fa = FileAttachment.new()
    fa.file = upload
    fa.course = course
    if fa.save!
      File.unlink(full_path)
      upload = nil
      fa.nil
    end
  end
end
