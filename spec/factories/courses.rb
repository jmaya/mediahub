# == Schema Information
#
# Table name: courses
#
#  id                     :integer          not null, primary key
#  name                   :string
#  company                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  file_attachments_count :integer          default(0)
#

FactoryGirl.define do
  factory :course do
    name "MyString"
company "MyString"
  end

end
