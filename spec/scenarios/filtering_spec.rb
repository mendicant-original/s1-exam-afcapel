require 'spec_helper'

describe Table, "filtering" do
  
  before do
    books = [["Don Quixote", "Miguel de Cervantes"], ["War and Peace", "Leo Tolstoy"]]
    @table = Table.new books, :columns => ['Book', 'Author']
  end
  
  it "should be possible to reduce a table to contain only the rows that pass a conditional" do
    @table.select! { |row| row.include? "Don Quixote" }
    
    @table.rows.size.should == 1
    @table.rows[0].include? "Don Quixote"
  end
  
end