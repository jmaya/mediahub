# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book       :string
#

class Book < ActiveRecord::Base
  mount_uploader :book, BookUploader
end
