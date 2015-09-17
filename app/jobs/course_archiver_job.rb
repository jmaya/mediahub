require 'fileutils'
require 'rubygems/package'

class CourseArchiverJob < ActiveJob::Base
  include ApplicationHelper
  queue_as :default

  def perform(course_id)
    course = Course.find course_id
    course_files = course.file_attachments.order(:position)
    course_archive_path = File.join(ENV["COURSE_ARCHIVE_DIRECTORY"], 'courses')
    FileUtils.mkdir_p course_archive_path unless File.exists? course_archive_path

    course_archive_file_name = course_id.to_s + "-" + sanitize_filename(course.name) + '.tar.gz'

    archive_name = File.join(course_archive_path, course_archive_file_name)
    File.open(archive_name, 'wb') do |file|
      Gem::Package::TarWriter.new(file) do |tar|
        course_files.each do |fa|
          file_name = fa.position.to_s + "_" + File.basename(fa.file.path)
          tar.add_file_simple(file_name, 0444, fa.file.size) do |io|
            io.write(File.read(fa.file.path))
          end
        end
      end
    end unless File.exists? archive_name
  end
end
