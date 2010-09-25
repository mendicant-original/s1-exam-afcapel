class Table
  attr_reader :rows
  
  def initialize(array = [], options = {})
    @rows = array
    columns = options[:columns] || []
    @columns = columns.collect { |name| name.downcase}
  end
  
  def column(name)
    index = @columns.index(name.downcase)
    column_at index
  end
  
  private
  
  def column_at(index)
    rows.collect{ |row| row[index]}
  end
  
end