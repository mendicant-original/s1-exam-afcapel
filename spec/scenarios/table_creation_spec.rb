require 'spec_helper'

describe Table, "initialization" do
  it "should be possible to create a new table with a two dimensional array" do
    table = Table.new [["Don Quixote", "Miguel de Cervantes"], ["War and Peace", "Leo Tolstoy"]]
    table.rows[0].should == ["Don Quixote", "Miguel de Cervantes"]
    table.rows[1].should == ["War and Peace", "Leo Tolstoy"]
  end
  
  it "should be possible to create an empty table object" do
    table = Table.new 
    table.rows.size.should == 0
  end
  
end