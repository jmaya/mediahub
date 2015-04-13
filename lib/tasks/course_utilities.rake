require 'find'
require 'company_parser'

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
			puts "Updating size for #{f.path} with  #{size} bytes"
			f.updatte_attribute(:file_size, size)
		end
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
end

