module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods
    attr_accessor :headers, :csv_contents
    
    include Enumerable
    
    def initialize
      read
    end
    
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')
      
      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    def each
      @csv_contents.each do |row|
        yield CsvRow.new headers, row
      end
    end
  end
end

class CsvRow
  def initialize headers, data
    @headers = headers
    @data = data
  end
  
  def method_missing name, *args
    name = name.to_s.downcase
    if @headers.include? name
      @data[@headers.index name]
    else
      raise "No such method: #{name}"
    end
  end
end

class RubyCsv
  include ActsAsCsv
  
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each {|row| puts row.one}