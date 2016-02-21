require 'rails_helper'

RSpec.describe TrackCourse, type: :model do

    it { should belong_to(:track) }
    it { should belong_to(:course) }
end
