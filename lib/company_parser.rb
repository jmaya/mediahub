class CompanyParser
  attr_reader :name

  COMPANIES = ["Pluralsight", "TeamTree"]

  def initialize(item_name)
    @name = item_name
  end

  def company
    parse
    name
  end

  private
  def parse
    COMPANIES.each do |c|
      if name.match(/(#{c})/)
          @name = $1
      end
    end
  end
end
