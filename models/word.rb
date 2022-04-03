class Word
  def initialize(word)
    @word = word.downcase
    temp_replace_contraction
    temp_replace_hyphens
    strip_puntuation
    restore_contraction
    restore_hyphens
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
      @word[l] = CONTRACTION_REPLACEMENT_1
    end
    if @word.match(/.’./)
      l = @word.index("’")
      if l == 0
        l = @word.index("’", 1)
      end
      @word[l] = CONTRACTION_REPLACEMENT_2
    end
    @word
  end

  def restore_contraction
    @word.gsub!(CONTRACTION_REPLACEMENT_1, "'")
    @word.gsub!(CONTRACTION_REPLACEMENT_2, "’")
  end

  def temp_replace_hyphens
    last_char = @word[@word.length - 1]
    if last_char == "-" || last_char == "—"
      @word = @word[0..(@word.length - 2)]
    end

    @word.gsub!("-", HYPHEN_NDASH_REPLACEMENT)
    @word.gsub!("—", HYPHEN_MDASH_REPLACEMENT)
  end

  def restore_hyphens
    @word.gsub!(HYPHEN_NDASH_REPLACEMENT, "-")
    @word.gsub!(HYPHEN_MDASH_REPLACEMENT, "—")
  end

  def to_string
    @word
  end

  private
    CONTRACTION_REPLACEMENT_1 = "A"
    CONTRACTION_REPLACEMENT_2 = "B"
    HYPHEN_NDASH_REPLACEMENT = "C"
    HYPHEN_MDASH_REPLACEMENT = "D"
end
