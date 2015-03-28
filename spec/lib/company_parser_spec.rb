require 'spec_helper'

require 'company_parser'

describe CompanyParser do
  context "Company Name Parser"
  ["Pluralsight", "TeamTree"].each do |company|
    it "should parse #{company}" do
      item_name = "#{company} x y z"
      cp = CompanyParser.new(item_name)
      expect(cp.company).to eql(company)
    end
  end
end
