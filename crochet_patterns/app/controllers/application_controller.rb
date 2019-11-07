require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    @crochet_patterns = CrochetPattern.all
    erb :"crochet_patterns/index"
  end

  get '/crochet-patterns/new' do
    @users = User.all
    erb :"crochet_patterns/new"
  end

  get '/crochet-patterns/edit/:id' do
    @users = User.all
    @crochet_pattern = CrochetPattern.find_by_id(params["id"])
    erb :"crochet_patterns/edit"
  end
  
  patch '/crochet-patterns/:id' do 
    @crochet_pattern = CrochetPattern.find_by_id(params["id"])
    params.delete("_method")

    if @crochet_pattern.update(params)
      redirect "crochet-patterns/#{@crochet_pattern.id}"
    else
      redirect "crochet-patterns/#{@crochet_pattern.id}/edit"
    end
  end

  get '/crochet-patterns/:id' do
    @crochet_pattern = CrochetPattern.find_by_id(params["id"])
    erb :"crochet_patterns/show"
  end

  post '/crochet-patterns' do 
    crochet_pattern = CrochetPattern.new(params)
    if crochet_pattern.save
      redirect "crochet-patterns/#{crochet_pattern.id}"
    else
      redirect "crochet-patterns/new"
    end
  end

end