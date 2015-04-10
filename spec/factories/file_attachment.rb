FactoryGirl.define do
  factory :file_attachment do
    file File.open(Rails.root + "spec" + "fixtures" + "test.mp4")
  end
end
