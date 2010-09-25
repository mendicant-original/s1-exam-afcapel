require 'spec_helper'

describe Table do
  it "should be possible to create a new table with a two dimensional array" do
    table = Table.new [["Don Quixote", "Miguel de Cervantes"], ["War and Peace", "Leo Tolstoy"]]
    table.rows[0].should == ["Don Quixote", "Miguel de Cervantes"]
    table.rows[1].should == ["War and Peace", "Leo Tolstoy"]
  end
  
  it "should be possible to create an empty table object" do
    table = Table.new 
    table.rows.should be_empty
  end
  
  it "should be possible append data to an empty table object" do
    table = Table.new 
    table.rows << ["Don Quixote", "Miguel de Cervantes"]
    table.rows << ["War and Peace", "Leo Tolstoy"]
    
    table.rows[0].should == ["Don Quixote", "Miguel de Cervantes"]
    table.rows[1].should == ["War and Peace", "Leo Tolstoy"]
  end
  
  it "should be possible to set column names" do
    books = [["Don Quixote", "Miguel de Cervantes"], ["War and Peace", "Leo Tolstoy"]]
    table = Table.new books, :columns => ['Book', 'Author']
    
    table.column('author').should == ["Miguel de Cervantes", "Leo Tolstoy"]
    table.column('book').should == ["Don Quixote", "War and Peace"]
  end
  
end