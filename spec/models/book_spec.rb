# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  book       :string
#

require 'rails_helper'

RSpec.describe Book, :type => :model do
end
