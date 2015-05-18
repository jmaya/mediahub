require "rails_helper"

RSpec.describe "File Attachment API", :type => :request do

  it "creates a Widget and redirects to the Widget's page" do
    get "/api/v1//file_attachments/exists?hash=xxxxx"
    expect(response.status).to eql(404)
    expect(JSON.parse(response.body)["error"]).to eql("File Attachment not found")
  end

end
