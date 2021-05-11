require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base

#get '/' do, which renders the index.erb page.
  get '/' do
    erb :index
  end

#post '/' do, which receives the form data through params and renders the results page.
  post '/' do
  text_from_user = params[:user_text]

#To use the model we've created with our controller, we need to connect the two. In order to do this, we'll add a require_relative statement to the controller so that this file can use this new class.. At the top of app.rb, add require_relative "models/text_analyzer.rb". This now gives us the ability to reference the TextAnalyzer class and invoke its new method.
#data from params[:user_text] (in the post '/' do route) and feed it into a new instance of the TextAnalyzer class:
  @analyzed_text = TextAnalyzer.new(params[:user_text])
#the instance of TextAnalyzer saved to an instance variable called @analyzed_text. This means that we can call it and its methods from the results.erb view that is being rendered, using erb tags
  erb :results
  end

end
