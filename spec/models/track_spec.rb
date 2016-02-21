require 'rails_helper'

RSpec.describe Track, type: :model do
  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:category) }
    it { should have_many(:track_courses) }
  end
end
