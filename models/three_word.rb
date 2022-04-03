require './models/word.rb'

class ThreeWord
  def initialize(file)
    @file = file
    @h = {}
    @runningMaxKey = nil
  end

  def process_file
    File.open(@file, "r").each_line do |line|
      process_line(line)
    end
    puts @runningMaxKey
    puts @h[@runningMaxKey]
  end

  def process_line(line)
    words = line.split(" ")

    words.each_with_index do |w, i|
      if i < words.length - 2
        threeWord = "#{Word.new(words[i]).to_string} #{Word.new(words[i+1]).to_string} #{Word.new(words[i+2]).to_string}"
        if @h[threeWord] != nil
          @h[threeWord]+=1
        else
          @h[threeWord] = 1
        end
        if @runningMaxKey.nil? || @h[threeWord] > @h[@runningMaxKey]
          @runningMaxKey = threeWord
        end
      end
    end
  end
end

