#!ruby
# coding: utf-8
require "logger"

filename = ARGV[0]
resultfile = filename.to_s + ".txt"

if File.exist?(resultfile)
  File.delete(resultfile)
end


File.readlines(ARGV[0]).each do |line|
  utfs = line.scan(/(\\u[\w\d]{4})/)
  utfs.each{|utf|
    line.sub!(utf[0],(utf[0][2,4]).to_i(16).chr("UTF-8"))
  }
  
  File::open(resultfile , "a+").write(line)
end

#str=File.readlines(ARGV[0]).each.dup;str.scan(/(\\u[\w\d]{4})/).each{|utf|str.sub!(utf[0],(utf[0][2,4]).to_i(16).chr('UTF-8'))}
#puts str

