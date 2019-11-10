class CrochetPatternController < ApplicationController
  @@sizes = ["Small", "Medium", "Large", "XXL"]

  get "/crochet-patterns" do
    if logged_in?
      @crochet_patterns = current_user.crochet_patterns
      erb :"crochet_patterns/index"
    else
      redirect "/login"
    end
  end

  get '/crochet-patterns/new' do
    if logged_in?
      erb :"crochet_patterns/new"
    else
      redirect "/login"
    end
  end

  get '/crochet-patterns/edit/:id' do
    if logged_in?
      @crochet_pattern = current_user.crochet_patterns.find_by_id(params["id"])
      if @crochet_pattern
        erb :"crochet_patterns/edit"
      else
        redirect "/crochet-patterns"
      end
    else
      redirect "/login"
    end
  end
  
  patch '/crochet-patterns/:id' do 
    if logged_in?
      @crochet_pattern = current_user.crochet_patterns.find_by_id(params["id"])
      params.delete("_method")

      if @crochet_pattern.update(params)
        redirect "crochet-patterns/#{@crochet_pattern.id}"
      else
        redirect "crochet-patterns/#{@crochet_pattern.id}/edit"
      end
    else
      redirect "/login"
    end
  end

  get '/crochet-patterns/:id' do
    if logged_in?
      @crochet_pattern = current_user.crochet_patterns.find_by_id(params["id"])
      if @crochet_pattern
        erb :"crochet_patterns/show"
      else
        redirect "/crochet-patterns"
      end
    else
      redirect "/login"
    end
  end

  post '/crochet-patterns' do
    if logged_in?
      @crochet_pattern = current_user.crochet_patterns.create(params)
      if @crochet_pattern.save
        redirect "crochet-patterns/#{@crochet_pattern.id}"
      else
        redirect "crochet-patterns/new"
      end
    else
      redirect "/login"
    end
  end

  delete '/crochet-patterns/:id' do
    if logged_in?
      @crochet_pattern = current_user.crochet_patterns.find_by_id(params["id"])
      if @crochet_pattern
        @crochet_pattern.delete
      end
      redirect "/crochet-patterns"
    else
      redirect "/login"
    end
  end
end