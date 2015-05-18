require 'tempfile'
File.open(Rails.root + "spec" + "fixtures" + "test.mp4", "w") do |f|
  f.write("This is a test.")
end
FactoryGirl.define do
  factory :file_attachment do
    file File.open(Rails.root + "spec" + "fixtures" + "test.mp4")
  end
end
