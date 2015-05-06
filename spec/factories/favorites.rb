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

FactoryGirl.define do
  factory :favorite do
    user nil
favorited nil
  end

end
