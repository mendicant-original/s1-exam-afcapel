class Column < Array
  attr_accessor :name
  attr_accessor :table
  
  def initialize(table, name = nil)
    @name = name
    @table = table
  end
  
  def collect!(&block)
    index = @table.columns.index self
    @table.rows.each do |row|
      row[index] = block.call(row[index])
    end
  end
end

module ColumnIndex
  attr_accessor :column_names
  attr_accessor :table
  
  def [](arg)
    case arg
    when String
      index = column_names.index(arg)
      return self[index]
    else
      super
    end
  end
  
  def <<(col)
    col.each_index do |i|
      @table.rows[i] << col[i]
    end
    super
  end
  
  def insert(pos, col)
    col.each_index do |i|
      @table.rows[i].insert(pos, col[i])
    end
    super
  end
  
  def delete_at(index)
    @table.rows.each do |row|
      row.delete_at(index)
    end
    super
  end
end

class Table
  attr_reader :rows
  
  def initialize(array = [], options = {})
    @rows = array
    @columns = []
    
    @columns.extend ColumnIndex
    @columns.table = self
    
    if options[:columns]
      options[:columns].each do |name|
        column = Column.new(self, name)
        @columns << column
      end
    else
      0.upto(row_length).each do |i|
        @columns << Column.new(self)
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
  
  def select_rows!(&block)
    @rows = @rows.select(&block)
  end
  
  def select_columns!(&block)
    rejected_columns = columns.reject(&block)
    rejected_columns.each do |col|
      index = @columns.index col
      @rows.each do |row|
        row.delete_at(index)
      end
      
      @columns.delete col
    end
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