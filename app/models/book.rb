class Book < ActiveRecord::Base
  mount_uploader :book, BookUploader
end
