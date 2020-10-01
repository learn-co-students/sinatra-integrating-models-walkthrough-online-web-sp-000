require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    #we're sending the data to a MODEL
    #then take the result and give it to the VIEWs
    #this is how a legit CONTROLLER works
    
    text_from_user = params[:user_text]
    @analyzed_text = TextAnalyzer.new(text_from_user)
    erb :results
    #nothing fancy. we just turn it into an instance 

        #btw, to see what most used letter output, since it outputs more than one thing
        #do this, very convenient: 
        #raise  @analyzed_text.most_used_letter.inspect
  end


end
