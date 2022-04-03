#!/usr/bin/ruby
require './models/three_word.rb'

# a = ThreeWord.new
# key, val  =  a.draft("this is a test line'")
# puts key
# puts val

# 1 file path
if ARGV.length > 0
  #get file paths
  ARGV.each do |file|
    if File.exist?(file)
      f = ThreeWord.new(file)
      f.process_file

      # File.open(file, "r").each_line do |line|
      #   puts line
      # end
      # file.close
    else
      puts "File: \"#{file}\" does not exist. Please verify the path"
    end
  end
end


# The program accepts a list of one *or more* file paths (e.g. `ruby solution.rb texts/moby-dick.txt brothers-karamazov.txt ...).`
# The program *also* accepts input via stdin (e.g. `cat texts/*.txt | java solution.java`).








# The program outputs the first 100 most common three word sequences.
