require 'spec_helper'
require "yaml"

describe Table, "example scenario" do
  
  it "should run the example scenario" do
    data = YAML::load(File.open("#{File.dirname(__FILE__)}/s1-exam-data.yaml"))
    
    column_names = data.slice!(0)
    
    table = Table.new(data, :columns => column_names)
    
    # 1. Restrict the rows to dates that occur in June 2006
    
    table.rows.delete_if { |row| not row[0] =~ %r{06/\d\d/06} }
    table.rows.compact
    
    # 2. Convert the AMOUNT, TARGET_AMOUNT, and AMTPINSPAID columns to money
    # format. (e.g 1500 becomes $15.00)
    %w{AMOUNT TARGET_AMOUNT AMTPINSPAID}.each do |col|
      table.column(col).collect! do |content|
        if content.size > 2
          content.gsub!(%r{(\d*)?(\d\d)}, "$\\1.\\2")
        else
          content.gsub!(%r{^\d*$}, "$\\0.00")
        end
      end
    end
    
    # 3. Remove the Count column
    table.columns.delete table.column('Count')
    
    # 4. Change the date format to YYYY-MM-DD
    table.columns[0].collect! { |content| content.gsub!(%r{(\d\d)/(\d\d)/(\d\d)}, "20\\3-\\1-\\2") if content}
    
    # 5. Convert the table to an array of arrays, and then write out a YAML
    # file called 's1-exam-data-transformed.yaml', including the headers as
    # the first row.
    
    data = table.rows
    column_names = table.columns.collect { |c| c.name }
    data.insert 0, column_names
    
    File.open("#{File.dirname(__FILE__)}/s1-exam-data-transformed.yaml", 'w') do |out|
      YAML::dump data, out
    end
    
  end
  
end