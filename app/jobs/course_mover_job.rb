# encoding: utf-8

require 'tempfile'

class CourseMoverJob < ActiveJob::Base
  queue_as :default

  def perform(course_id, full_path, data)
    course = Course.find course_id
    new_name = File.join(File.dirname(full_path), data["original_filename"])
    File.rename full_path, new_name
    fa = FileAttachment.new(course: course)
    File.open(new_name) do |f|
      fa.file = f
    end
    fa.save!
  end
end
