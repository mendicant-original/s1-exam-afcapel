class Column < Array
  attr_accessor :name
end

class Table
  attr_reader :rows
  
  def initialize(array = [], options = {})
    @rows = array
    @columns = []
    
    if options[:columns]
      options[:columns].each do |name|
        column = Column.new
        column.name = name
        @columns << column
      end
    else
      0.upto(row_length).each do |i|
        @columns << Column.new
      end
    end
  end
  
  def columns
    @columns.each_index do |i|
      @columns[i] = column_at(i)
    end
    
    @columns
  end
  
  def column(col)
    case col
    when String
      column =  @columns.find { |c| c.name.downcase == col.downcase }
      index = @columns.index column
      column_at index
    when Integer
      column_at col
    end
  end
  
  def [](index)
    @rows[index]
  end
  
  private
  
  def row_length
    rows.empty? ? 0 : rows[0].size
  end
  
  def column_at(index)
    @columns[index].clear
    
    @rows.each_index do |i|
      @columns[index] << @rows[i][index]
    end
    
    @columns[index]
  end
  
end