class Course < ActiveRecord::Base
  has_many :file_attachments
  accepts_nested_attributes_for :file_attachments
end
