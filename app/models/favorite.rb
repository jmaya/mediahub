class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorited, polymorphic: true

  validates_presence_of :user
end
