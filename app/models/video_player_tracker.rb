class VideoPlayerTracker < ActiveRecord::Base
  belongs_to :user
  belongs_to :file_attachment
end
