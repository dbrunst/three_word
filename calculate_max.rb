#!/usr/bin/ruby

require './models/three_word.rb'
require 'timeout'

if !ARGV.empty?
  files = []
  ARGV.each do |file|
    if File.exist?(file)
      files.append(file)
    else
      puts "File: \"#{file}\" does not exist. Please verify the path"
      return
    end
  end
  f = ThreeWord.new(files)
  f.process_file
  f.print_top_100
else
  t = 10
  begin
    status = Timeout::timeout(t) {
      f = ThreeWord.new()
      f.process_lines(ARGF)
      f.print_top_100
    }
  rescue Timeout::Error
    puts "Usage: `ruby ./calculate_max.rb {file} {file}`"
    puts "Usage: `cat {dir/files} | ruby ./calculate_max.rb`"
  end
end
