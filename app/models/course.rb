class Course < ActiveRecord::Base
  has_many :file_attachments, dependent: :destroy
  accepts_nested_attributes_for :file_attachments

  validates :name, :presence => true
  validates :name, :uniqueness => true
end
