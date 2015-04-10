require 'digest/sha1'

class FileAttachment < ActiveRecord::Base

  before_validation :update_sha_1_hash
  validates_uniqueness_of :sha_1_hash

  mount_uploader :file, FileUploader
  belongs_to :course

  private

  def update_sha_1_hash
    self.sha_1_hash = Digest::SHA1.file(file.path).hexdigest
  end

end
