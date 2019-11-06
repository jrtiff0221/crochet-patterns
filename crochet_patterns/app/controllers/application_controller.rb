require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get '/crochet-patterns' do
    @crochet_patterns = CrochetPattern.all
    erb :"crochet_patterns/index"
  end
end
