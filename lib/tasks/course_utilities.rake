require 'find'
require 'company_parser'
require 'digest/sha1'
require 'rest-client'
require 'json'

namespace :courses do
  desc "Match Company"
  task :parse_company => :environment do
    Course.all.each do |course|
      company_parser = CompanyParser.new(course.name)
      unless company_parser.name.nil?
        puts "Updating company for #{course.name} to #{company_parser.company}"
        course.update_attribute(:company,company_parser.company)
      end
    end
  end

  desc "Update size"
  task :update_size => :environment do
    Course.all.each do |course|
      course.file_attachments.each do |f|
        next if f.file_size
        if File.exist? f.file.path
          size = File.size f.file.path
          puts "Updating size for #{f.file.path} with  #{size} bytes"
          f.update_attribute(:file_size, size)
        end
      end
    end
  end
  desc "Update File Basename"
  task :update_file_basename=> :environment do
    Course.all.each do |course|
      course.file_attachments.each do |f|
        f.save if f.file_basename.nil?
      end
    end
  end

  desc "Import Directory of CBT's"
  task :import => :environment do
    valid_formats = %w[.mov .MOV .flv .FLV .mp4 .MP4]
    Dir.glob("#{ENV['COURSES_PATH']}/*").collect do |p|
      p if File.directory? p
    end.compact.each do |p|
      c = Course.new(name: File.basename(p))
      Find.find(p).each do |f|
        if valid_formats.include?(File.extname(f))
          c.file_attachments.build(:file => File.open(f, 'rb'))
        end
      end
      puts "Saving #{c.name}"
      c.save
    end

  end

  desc "Remote import of Courses COURSE_PATH URL"
  task :remote_import do
    valid_formats = %w[.mov .MOV .flv .FLV .mp4 .MP4]
    course_path = ENV['COURSE_PATH']
    url = ENV['URL']
    processed_folder = File.join(File.dirname(course_path), "processed")
    FileUtils.mkdir_p processed_folder
    Dir.glob(File.join(course_path, "*")).each do |course|
      next if File.basename(course) == "processed"
      course_name = File.basename(course)
      # Create course with name
      course_id = JSON.parse(RestClient.post("#{url}/api/v1/courses", course: { name:course_name }))['id']
      Find.find("#{course_path}/#{course_name}") do |f|
        if valid_formats.include?(File.extname(f))
          puts "Uploading #{f}"
          sha1_to_verify = Digest::SHA1.file(f).hexdigest
          begin
            RestClient.get("#{url}/api/v1/file_attachments/exists.json?hash=#{sha1_to_verify}")
          rescue RestClient::ResourceNotFound
            puts "#{sha1_to_verify} #{f} noes not exists"
            puts "Uploading #{f}"
            resource = RestClient::Resource.new(
              "#{url}/api/v1/file_attachments",
              timeout: 100000,
              open_timeout:100000
            )
            resource.post  file_attachment: {
              course_id: course_id,
              file: File.new(f, 'rb')
            }
          end
        end
      end
      FileUtils.move course, processed_folder
    end
  end
end
