require 'spec_helper'

require 'company_parser'

describe CompanyParser do
  context "Company Name Parser" do
  ["Pluralsight", "TeamTree"].each do |company|
    it "should parse #{company}" do
      item_name = "#{company} x y z"
      cp = CompanyParser.new(item_name)
      expect(cp.company).to eql(company)
    end

    it 'escapes regular expression chars in files' do
      cp = CompanyParser.new('a|\!?one.thing pluralsight')
      expect(cp.company).to eql("Pluralsight")
    end
  end

  end
end
