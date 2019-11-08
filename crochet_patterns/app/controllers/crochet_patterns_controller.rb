  class CrochetPatternsController < ApplicationController
    
    get "/crochet-patterns" do
      @crochet_patterns = CrochetPatterns.all
      erb :"crochet_patterns/index"
    end

    get '/crochet-patterns/new' do
      @users = User.all
      erb :"crochet_patterns/new"
    end

    get '/crochet-patterns/edit/:id' do
      @users = User.all
      @crochet_pattern = CrochetPatterns.find_by_id(params["id"])
      erb :"crochet_patterns/edit"
    end
    
    patch '/crochet-patterns/:id' do 
      @crochet_pattern = CrochetPatterns.find_by_id(params["id"])
      params.delete("_method")

      if @crochet_pattern.update(params)
        redirect "crochet-patterns/#{@crochet_pattern.id}"
      else
        redirect "crochet-patterns/#{@crochet_pattern.id}/edit"
      end
    end

    get '/crochet-patterns/:id' do
      @crochet_pattern = CrochetPatterns.find_by_id(params["id"])
      erb :"crochet_patterns/show"
    end

    post '/crochet-patterns' do 
      crochet_pattern = CrochetPatterns.new(params)
      if crochet_pattern.save
        redirect "crochet-patterns/#{crochet_pattern.id}"
      else
        redirect "crochet-patterns/new"
      end
    end

    delete '/crochet-patterns/:id' do 
      @crochet_pattern = CrochetPatterns.find_by_id(params["id"])
      @crochet_pattern.delete
      redirect "/"
    end

end