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

require 'rails_helper'

RSpec.describe Course, :type => :model do
end
