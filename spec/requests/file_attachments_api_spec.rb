require "rails_helper"

RSpec.describe "File Attachment API", :type => :request do
  before(:each) do
  end

  it "creates a Widget and redirects to the Widget's page" do
    get "/api/v1//file_attachments/exists?hash=xxxxx"
    expect(response.status).to eql(404)
    expect(JSON.parse(response.body)["error"]).to eql("File Attachment not found")
  end

  it 'should respond with a 200 if the record exists' do
    File.open(Rails.root + "spec" + "fixtures" + "test.mp4", "w") do |f|
      f.write("This is a test.")
    end

    @file_attachment = create(:file_attachment)
    get "/api/v1//file_attachments/exists?hash=#{@file_attachment.sha_1_hash}"
    expect(response.status).to eql(200)
    expect(JSON.parse(response.body)["sha_1_hash"]).to eql("afa6c8b3a2fae95785dc7d9685a57835d703ac88")
  end

end
