#!/usr/bin/env ruby

if 2 != ARGV.length
  raise "RGrep requires two arguments: rgrep <pattern> <file>"
end

pattern  = ARGV.shift
filename = ARGV.shift

regExp = Regexp.new(pattern, Regexp::IGNORECASE)

begin
  file = File.new(filename, 'r')

  i = 1
  while (line = file.gets)
    puts "#{i.to_s.ljust(4)} #{line}" if regExp.match(line)
    i = i + 1
  end
rescue IOError => e
  raise "No such file: #{filename}"
end