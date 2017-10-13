class VideoPlayerTracker < ActiveRecord::Base
  belongs_to :user
  belongs_to :file_attachment

  validates :user, presence: true
  validates :file_attachment, presence: true
  validates :left_at, presence: true
end
