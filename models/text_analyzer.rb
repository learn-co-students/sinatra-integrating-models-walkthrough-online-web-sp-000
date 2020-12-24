# Your TextAnalyzer model code will go here.
class TextAnalyzer
  attr_reader :text
 
  def initialize(text)
    @text = text.downcase
  end
 
  def count_of_words
    words = text.split(" ")
    words.count
  end
 
  def count_of_vowels
    text.scan(/[aeoui]/).count
  end
 
  def count_of_consonants
    text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end
 
  def most_used_letter
    s1 = text.gsub(/[^a-z]/, '') # gets rid of spaces
    arr = s1.split('')
    arr1 = arr.uniq
    arr2 = {}
 
    arr1.map do |c|
      arr2[c] =  arr.count(c)
    end
 
    biggest = { arr2.keys.first => arr2.values.first }
    max_letter = arr2.keys.first
    max_frequency = arr2.values.first
    arr2.each do |key, value|
      if value > max_frequency
        max_letter = key
        max_frequency = value
      end
    end
 
    {:letter =>max_letter.upcase, :frequency => max_frequency}
  end
end
