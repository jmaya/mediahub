# == Schema Information
#
# Table name: favorites
#
#  id             :integer          not null, primary key
#  user_id        :integer          not null
#  favorited_id   :integer
#  favorited_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorited, polymorphic: true

  validates_presence_of :user
end
