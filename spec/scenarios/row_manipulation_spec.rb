require 'spec_helper'

describe Table, "Row manipulation" do
  
  before do
    books = [["Don Quixote", "Miguel de Cervantes"], ["War and Peace", "Leo Tolstoy"]]
    @table = Table.new books, :columns => ['Book', 'Author']
  end
  
  it "should be possible to retrieve an array consisting of all the contents in that row" do
    @table.rows[0].should == ["Don Quixote", "Miguel de Cervantes"]
    @table.rows[1].should == ["War and Peace", "Leo Tolstoy"]
  end
  
  it "should be possible to append a row to the end of the table" do
    @table.rows << ["Harry Potter and the Philosopher Stone", "J.K. Rowling"]
    
    @table.rows[2].should == ["Harry Potter and the Philosopher Stone", "J.K. Rowling"]
  end
  
end