require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]

    @analyzed_text = TextAnalyzer.new(text_from_user)

    erb :results
  end
end
#it starts by user going to a home page "/" which
#transfers us to erb :index
#when in index, we have a form, that says
#method POST action "/" which means
#go to POST on a home page
#back in the controller we access that where we
#save the user's text(params) in a variable text_from_user
#which is then used as an attribute for TextAnalyzer.new
#which we defined in models
#after that we are redirected to :erb results
#where the content is shown
