require './models/word.rb'

class ThreeWord
  def initialize(files=[])
    @files = files
    @frequency = {}
    @top_100 = []
  end

  def process_file
    @files.each do |file|
      previous_words = []
      File.open(file, "r").each_line do |line|
        previous_words = process_line(previous_words, line)
      end
    end
    get_top_100
  end

  def process_lines(lines)
    previous_words = []
    lines.each do |line|
      previous_words = process_line(previous_words, line)
    end
    get_top_100
  end

  def process_line(previous_words, line)
    words =  previous_words + line.strip.split(" ")

    words.each_with_index do |w, i|
      if i < words.length - 2
        threeWord = "#{Word.new(words[i]).to_string} #{Word.new(words[i+1]).to_string} #{Word.new(words[i+2]).to_string}"
        if @frequency[threeWord] != nil
          @frequency[threeWord]+=1
        else
          @frequency[threeWord] = 1
        end
      end
    end
    words[(words.length-2)..]
  end

  def get_top_100
    @top_100 = Hash[@frequency.sort_by { |a,b| -b }[0..99]]
  end

  def print_top_100
    @top_100.each do |v|
      puts "#{v[0]} - #{v[1]}"
    end
  end
end

