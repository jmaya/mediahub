require 'find'

namespace :book do
  desc "Book Importer"
  task :importer => :environment do

    Find.find("/Users/jmaya/tmp") do |f|
      if File.file?(f) and f.downcase.end_with?(".pdf")
        begin
          RestClient.post( 'http://localhost:3000/books',
                          {
            :book => {
              :name => File.basename(f).gsub(/\.pdf/, "").gsub(/\s/,''), 
              :book => File.new(f,'rb')
            }
          })
        rescue RestClient::Found
          puts "Uploaded #{f}"
        end
      end
    end
  end
end
