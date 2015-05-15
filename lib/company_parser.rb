class CompanyParser
  attr_reader :name

  COMPANIES = [
    "Pluralsight", 
    "TeamTree", 
    'Laracasts',
    'InfiniteSkills',
    'Lynda',
    'Peachpit',
    'Nuggets',
    'Tutsplus',
    'Udemy',
    'Learnkey',
    'LinuxCBT',
    'Video2Brain',
    'AppDev',
    'VTC'
  
  ]

  def initialize(item_name)
    @name = item_name
    @match = nil
  end

  def company
    parse
    @match
  end

  private
  def parse
    COMPANIES.each do |c|
      if name.downcase.match(/#{c.downcase}/)
          @match = c
      end
    end
  end
end
