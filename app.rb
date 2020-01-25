require_relative 'config/environment'
require_relative 'models/text_analyzer.rb' #This gives us the ability to reference the TextAnalyzer class and invoke its new method.

class App < Sinatra::Base
  get '/' do #rout which renders the index.erb page
    erb :index
  end

  post '/' do #rout which recives data through params and renders the resullts page
    #text_from_user = params[:user_text]
    #@analyzed_text = TextAnalyzer.new(text_from_user)
    # 10 and 11 rows are shortened to:
    @analyzed_text = TextAnalyzer.new(params[:user_text]) #We have the instance of TextAnalyzer saved to an instance variable called @analyzed_text
                                                          #This means that we can call it and its methods from the results.erb view that is being rendered, using erb tags!
    erb :results  #in our results.erb file, use erb tags to display the data stored in the @analyzed_text variable.
  end
end
# Sinatra app that uses a model, views, and a controller!
# You are taking user input in a form, sending it via params to the 'post' route where a new instance of the model is created using the data from the form.
# This instance is passed back to the view, where it is rendered using erb tags. 
