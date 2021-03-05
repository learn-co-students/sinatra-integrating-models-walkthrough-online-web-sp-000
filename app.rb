require_relative "models/text_analyzer.rb"
require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
  @analyzed_text = TextAnalyzer.new(params[:user_text])
  @words = @analyzed_text.count_of_words
  @vowels = @analyzed_text.count_of_vowels
  @consonants = @analyzed_text.count_of_consonants
  
  @most_used_key = @analyzed_text.most_used_letter.first[0].upcase
  @most_used_value = @analyzed_text.most_used_letter.first[1]
 
 
  erb :results
end

end
