class TextAnalyzer
  attr_reader :text

  def initialize(text)
    @text = text
    self
  end

  # split at every space and count
  def word_count
    @text.split(' ').size
  end

  # get our long string as an array of characters
  def chars
    @text.dup.upcase.gsub(/[\W]/, '').split('')
  end

  # counts the characters in our long string
  def character_count
    chars.size
  end

  # counts the vowels from our #chars array
  def vowel_count
    chars.select { |e|
      e if e.match(/[aAeEiIoOuU]/)
    }.size
  end

  # counts the consonants from our #chars array
  def consonant_count
    chars.select { |e|
      e unless e.match(/[aAeEiIoOuU]/)
    }.size
  end

  # finds the most common character from our #chars array
  def most_common_letter
    char_hash = {}
    chars.each do |c|
      char_hash[c] ||= 1 unless char_hash[c]
      char_hash[c] += 1
    end

    # finds the highest conurrance
    max = char_hash.values.max

    # returns all in the case of a tie
    char_hash.map {|k,v| k unless v < max }.compact
  end

  # finds the most common character and then tells us how many times we used it
  def most_common_letter_count
    char = most_common_letter.first
    chars.select { |c| c if c == char }.size
  end

end