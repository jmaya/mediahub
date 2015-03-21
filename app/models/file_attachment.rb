class FileAttachment < ActiveRecord::Base
  mount_uploader :file, FileUploader
  belongs_to :course
end
