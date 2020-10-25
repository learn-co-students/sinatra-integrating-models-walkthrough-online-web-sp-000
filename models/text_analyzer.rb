# Your TextAnalyzer model code will go here.

class TextAnalyzer
  
  attr_accessor :text
  
  def initialize(text)
    @text = text.downcase
  end
  
  def count_of_word
    words = @text.split(" ")
    words.count
  end 
  
  def count_of_vowels
    @text.scan(/[aeoui]/).count
  end 
  
  def count_of_consonants
    @text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end
  
  def most_used_letter
    s1 = @text.gsub(/[^a-z]/, '')
    arr = s1.split('')
    arr1 = arr.uniq
    arr2 = {}
    
    arr1.map do |c|
      arr2[c] = arr.count(c)
    end
    
    biggest = { 
      :most_used_letter  => arr2.keys.first,
      :letter_count => arr2.values.first 
    }
    
    arr2.each do |key, value|
      if value > biggest.values[1]
        biggest = {
          :most_used_letter => "",
          :letter_count => ""
        }
        
        biggest[:most_used_letter] = key
        biggest[:letter_count] = value
      end
    end
    

    
    biggest
  end
end
