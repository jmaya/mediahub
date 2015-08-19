require "rails_helper"

RSpec.describe "Courses", :type => :request do
  before(:each) do
  end

  it "creates a Widget and redirects to the Widget's page" do
    post "/api/v1//courses", course: {name: "Test Course"}
    expect(response.status).to eql(200)
    expect(JSON.parse(response.body)["name"]).to eql("Test Course")
  end

end
