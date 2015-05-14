# == Schema Information
#
# Table name: file_attachments
#
#  id            :integer          not null, primary key
#  course_id     :integer
#  file          :string
#  created_at    :datetime
#  updated_at    :datetime
#  sha_1_hash    :string
#  file_size     :integer
#  content_type  :string
#  file_basename :string
#

require 'digest/sha1'

class FileAttachment < ActiveRecord::Base

  before_validation :update_sha_1_hash

  before_save :update_file_attachment_attributes

#  validates_uniqueness_of :sha_1_hash

  mount_uploader :file, FileUploader
  belongs_to :course, counter_cache: true

  before_validation do |fa|
    self.file_basename = File.basename(fa.file.path) unless fa.file.nil?
  end

  private

  def update_sha_1_hash
    return if file.path.nil?
    self.sha_1_hash = Digest::SHA1.file(file.path).hexdigest
  end

  def update_file_basename
    return if file.path.nil?
    self.file_basename = File.basename(file(file.path))
  end

  def update_file_attachment_attributes
    if file.present? && file_changed?
      self.content_type = self.file.content_type
      self.file_size = self.file.size
    end
  end

end
