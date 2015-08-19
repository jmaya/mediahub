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

class Course < ActiveRecord::Base
  acts_as_taggable

  has_many :file_attachments, -> { order(position: :asc) }, dependent: :destroy
  accepts_nested_attributes_for :file_attachments

  validates :name, :presence => true
  validates :name, :uniqueness => true
end
