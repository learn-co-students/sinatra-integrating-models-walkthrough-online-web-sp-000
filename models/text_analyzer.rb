# Your TextAnalyzer model code will go here.
class TextAnalyzer
  attr_accessor :text

  def initialize(text)
    @text = text.downcase
  end

  def count_words
    @text.split.count
  end

  def count_vowels
    @text.count("/[aeiou]/")
  end

  def count_consonants
    @text.count("/[bcdfghjklmnpqrstvwxyz]/")
  end

  def most_common_letter
    letter_hash = {}
    @text.split("").each do |letter|
      if letter_hash[letter.to_sym]
        letter_hash[letter.to_sym] += 1
      else
        letter_hash[letter.to_sym] = 1
      end
    end
    letter_hash.max_by {|k,v| v}
  end
end
