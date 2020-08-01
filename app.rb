require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'


require_relative "models/text_analyzer.rb"



class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    @analyzed_text = TextAnalyzer.new(params[:user_text])
     @times_used = @analyzed_text.most_used_letter.map{|k,v| v}.first
    erb :results
  end
end
