class Table
  attr_reader :rows
  
  def initialize(array = [], options = {})
    @rows = array
    columns = options[:columns] || []
    @columns = columns.collect { |name| name.downcase}
  end
  
  def columns
    columns = []
    row_length = rows.empty? ? 0 : rows[0].size
    
    0.upto(row_length).each do |i|
      columns << rows.collect { |row| row[i] }
    end
    
    columns
  end
  
  def column(col)
    case col
    when String
      index = @columns.index(col.downcase)
      column_at index
    when Integer
      column_at col
    end
  end
  
  def [](index)
    @rows[index]
  end
  
  private
  
  def column_at(index)
    rows.collect{ |row| row[index]}
  end
  
end