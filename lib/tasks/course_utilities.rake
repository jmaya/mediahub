require 'find'

namespace :courses do
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

