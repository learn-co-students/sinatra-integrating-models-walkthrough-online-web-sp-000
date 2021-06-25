# Your TextAnalyzer model code will go here.
class TextAnalyzer
  attr_reader :text

  def initialize(text)
    @text = text.downcase
  end

  def count_of_words
    @text.split(" ").count
  end

  def count_of_vowels
    @text.scan(/[aeiuo]/).count
  end

  def count_of_consonants
    @text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end

  def most_used_letter
    letters = @text.gsub(/[^a-z]/, '')
    letter_array = letters.split("")
    unique_letters = letter_array.uniq
    letter_counts = {}

    unique_letters.map do |l|
      letter_counts[l] = letter_array.count(l)
    end

    biggest = {letter_counts.keys.first => letter_counts.values.first}

    letter_counts.each do |k,v|
      if v > biggest.values.first
        biggest = {}
        biggest[k] = v
      end
    end
  end


end
