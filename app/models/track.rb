class Track < ActiveRecord::Base
  validates :name,
    presence: true,
    uniqueness: true
  validates :category, presence: true
  has_many :track_courses
end
