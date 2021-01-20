# Your TextAnalyzer model code will go here.

class TextAnalyzer
    attr_reader :text
   
    def initialize(text) #initializer method which takes in a string text
      @text = text.downcase #converts text to lowercase and saves in instance variable @text
    end

    #This instance variable is then used in four instance methods, which provide information on the block of text in question.
    #If we wanted to use this class on it's own, we could do the following
    # my_text = TextAnalyzer.new("The rain in Spain stays mainly on the plain.")
    # my_text.count_of_words #=> 9
    # my_text.count_of_vowels #=> 13
    # my_text.count_of_consonants #=> 22
    # my_text.most_used_letter #=> {"n" => 6}

    #In general our models are agnostic about the rest of our application
    def count_of_words # we define a word as text with a space in between it and then count all the words
      words = text.split(" ")
      words.count
    end
   
    def count_of_vowels # we scan our text for vowels and count them
      text.scan(/[aeoui]/).count
    end
   
    def count_of_consonants # scan our text for consonants and count them
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