class Word
  def initialize(word)
    @word = word.downcase
    temp_replace_contraction
    strip_puntuation
    restore_contraction
  end

  def strip_puntuation
    @word.gsub!(/[^0-9a-z ]/i, '')
  end

  def temp_replace_contraction
    if @word.match(/.'./)
      l = @word.index("'")
      if l == 0
        l = @word.index("'", 1)
      end
      @word[l] = CONTRACTION_REPLACEMENT
    end
    @word
  end

  def restore_contraction
    @word.gsub!(CONTRACTION_REPLACEMENT, "'")
  end

  def to_string
    @word
  end

  private
    CONTRACTION_REPLACEMENT = "X"
end
