require 'spec_helper'

describe Table, "Column manipulation" do
  
  before do
    books = [["Don Quixote", "Miguel de Cervantes"], ["War and Peace", "Leo Tolstoy"]]
    @table = Table.new books, :columns => ['Book', 'Author']
  end
  
  it "should be possible to retrieve an array consisting of all the contents in that column" do
    @table.columns[0].should == ["Don Quixote", "War and Peace"]
    @table.columns[1].should == ["Miguel de Cervantes", "Leo Tolstoy"]
  end
  
end