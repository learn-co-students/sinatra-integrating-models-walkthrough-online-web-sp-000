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
      text.scan(/[aeoui]/).count # regex will select lowercase vowels (all the letters in @text are lowercase)
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
   
      arr2.each do |key, value|
        if value > biggest.values.first
          biggest = {}
          biggest[key] = value
        end
      end
   
      biggest
    end
  end

  # In general, models are agnostic to the rest of the application. 
  # If you used them in the Command Line or a Ruby on Rails app, they'd function the same way.
  
