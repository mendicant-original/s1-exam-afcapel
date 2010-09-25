require 'spec_helper'

describe Table, "column manipulation" do
  
  before do
    books = [["Don Quixote", "Miguel de Cervantes"], ["War and Peace", "Leo Tolstoy"]]
    @table = Table.new books, :columns => ['Book', 'Author']
  end
  
  it "should be possible to retrieve an array consisting of all the contents in that column" do
    @table.columns[0].should == ["Don Quixote", "War and Peace"]
    @table.columns[1].should == ["Miguel de Cervantes", "Leo Tolstoy"]
  end
  
  it "should be possible rename a column" do
    @table.column(1).name = "Writer"
    @table.column('writer').should == ["Miguel de Cervantes", "Leo Tolstoy"]
    
    @table.columns[0].name = "Novel"
    @table.column('novel').should == ["Don Quixote", "War and Peace"]
  end
  
  it "should be able to append a column to the right side of the table" do
    @table.columns.<< [1606, 1869]
    @table.column(2).should == [1606, 1869]
  end
  
  it "should be able to insert a column at any position in the table" do
    @table.columns.insert 1, [1606, 1869]
    
    @table.columns[0].should == ["Don Quixote", "War and Peace"]
    @table.columns[1].should == [1606, 1869]
    @table.columns[2].should == ["Miguel de Cervantes", "Leo Tolstoy"]
  end
  
  it "should be possible to delete any column" do
    @table.columns.delete_at 0
    @table.columns.size.should == 1
    
    @table.columns.delete ["Miguel de Cervantes", "Leo Tolstoy"]
    @table.columns.size.should == 0
  end
  
end