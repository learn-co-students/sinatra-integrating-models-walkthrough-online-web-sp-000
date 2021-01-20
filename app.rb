require_relative 'config/environment'
require_relative 'models/text_analyzer.rb' # connecting the model to the controller so our controller can use the methods within our model. 

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do 
    @analyzed_text = TextAnalyzer.new(params[:user_text]) # take the data from params[:user_text] and feed it into a new instance of TextAnalyzer class
    # We now have the instance of TextAnalyzer saved to an instance variable @analyzed_text, this means that we can call it and its methods from the results.erb view that is being renered, using erb tags!
    erb :results
  end
end
