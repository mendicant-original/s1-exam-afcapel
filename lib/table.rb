class Table
  attr_reader :rows
  
  def initialize(array = [])
    @rows = array
  end
end