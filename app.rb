require 'pry'
require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do

    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @most_used_hash = @analyzed_text.most_used_letter
    @most_used_hash.each do |key, value|
      @letter = key
      @num_of_times = value
    end

    erb :results
  end
end
